using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SOC
{
    public partial class imagetest : System.Web.UI.Page
    {

        string Filename;
        string FileExtenetion;
        string[] Currrentimageinfo = new string[8];
        StringBuilder cstext1 = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            //imgResize.Style.Add("background", "transparent");
            //imgResize.Style.Add("background", "none");
        }
        public static Bitmap Altertransparancey(System.Drawing.Image image,byte Alpha)
        {
            Bitmap orgimg = new Bitmap(image);
            Bitmap transparencyimg = new Bitmap(image.Width,image.Height);
            Color c = Color.Black;
            Color v = Color.Black;
            
            for(int i=0;i<image.Width;i++)
            {
                for (int y = 0; y < image.Height; y++)
                {
                    c = orgimg.GetPixel(i, y);
                    v = Color.FromArgb(Alpha, c.R, c.G, c.B);
                    transparencyimg.SetPixel(i, y, v);
                }
            }

            return transparencyimg;
        }

        public Bitmap TransparentColor(Bitmap bmp1, Color target)
        {
            Bitmap bmp2 = new Bitmap(bmp1.Width, bmp1.Height);
            Rectangle rect = new Rectangle(Point.Empty, bmp1.Size);
            using (Graphics G = Graphics.FromImage(bmp2))
            {
                G.Clear(target);
                G.DrawImageUnscaledAndClipped(bmp1, rect);
            }
            return bmp2;
        }

        public string GetImageinfo(int index)
        {
            //0-Height
            //1-Width
            //2-FileName
            //3-OriginalExtension
            //4-ConvertedExtension
            //5-AngleOfRotation
            //6-Invert- 0-No, 1-Yes

            if (Session["Currrentimageinfo"] != null && Session["Currrentimageinfo"].ToString() != null)
                Currrentimageinfo = (string[])Session["Currrentimageinfo"];

            return Currrentimageinfo[index];
        }


        public void SetImageinfo(int index, string value)
        {
            //0-Height
            //1-Width
            //2-FileName
            //3-OriginalExtension
            //4-ConvertedExtension
            //5-AngleOfRotation
            //6-Invert- 0-No, 1-Yes
            //7Convertedfilename
            if (Session["Currrentimageinfo"] != null && Session["Currrentimageinfo"].ToString() != null)
            {

                Currrentimageinfo = (string[])Session["Currrentimageinfo"];
                Currrentimageinfo[index] = value;
                //Session["Currentimageinfo"] = null;
                //Session["Currentimageinfo"] = Currrentimageinfo;
            }
        }
        public byte[] ImageToByteArray(System.Drawing.Image image)
        {
            ImageConverter converter = new ImageConverter();
            byte[] bytes;
            bytes = (byte[])converter.ConvertTo(image, typeof(byte[]));
            return bytes;
        }
        // resizing the image 
        protected byte[] Resizeimage(byte[] bytes, int height, int width)
        {

            byte[] Resizedbytes;

            var res = new Bitmap(width, height);
            System.Drawing.Image img = byteArrayToImage(bytes);
            //img.Height = Convert.ToInt32(dim.Item1);
            System.IO.MemoryStream stream = new System.IO.MemoryStream(bytes, true);
            stream.Write(bytes, 0, bytes.Length);
            using (var graphic = Graphics.FromImage(res))
            {
                graphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
                graphic.SmoothingMode = SmoothingMode.HighQuality;
                graphic.PixelOffsetMode = PixelOffsetMode.HighQuality;
                graphic.CompositingQuality = CompositingQuality.HighQuality;
                graphic.DrawImage(img, 0, 0, width, height);
            }
            //ImageConverter converter = new ImageConverter();

            Session["Currentimage"] = res;
            //byte[] resizedbytes;
            Resizedbytes = ImageToByteArray(res);
            Session["Currentimgbytes"] = Resizedbytes;
            return Resizedbytes;
        }
        //taking input as bytes and converting in to image and returning image
        public System.Drawing.Image byteArrayToImage(byte[] byteArrayIn)
        {
            MemoryStream ms = new MemoryStream(byteArrayIn);
            System.Drawing.Image returnImage = System.Drawing.Image.FromStream(ms);
            return returnImage;
        }
        public static Tuple<double, double> CalculateAspectratio(double Item1, double Item2, int Maxwidth, int Maxheight)
        {
            //BussinessEntity dim = new BussinessEntity();
            //Dimensions dim = new Dimensions();
            double scaleHeight = Maxheight / Item1;
            double scaleWidth = Maxwidth / Item2;
            double scale = Math.Min(scaleHeight, scaleWidth);
            Item1 = Item1 * scale;
            Item2 = Item2 * scale;
            var dim = new Tuple<double, double>(Item1, Item2);
            return dim;
        }
        protected void Upload_Click(object sender, EventArgs e)
        {
            //Checking Session for image 
            if (Session["Currentimage"] != null || Session["Currentimgbytes"] != null || Session["rotatedimage"] != null || Session["orginalbytes"] != null || Session["Currrentimageinfo"] != null || Session["orginalimage"] != null || Session["bwColorbytes"] != null)
            {
                Session["Currentimage"] = null;
                Session["Currentimgbytes"] = null;
                Session["bwColorbytes"] = null;
                Session["orginalbytes"] = null;
                Session["Currrentimageinfo"] = null;
                Session["orginalimage"] = null;
                Session["rotatedimage"] = null;
                Session.Remove("Currentimage");
                Session.Remove("bytes");
                Session.Remove("orginalbytes");
                Session.Remove("Currrentimageinfo");
                Session.Remove("orginalimage");
                Session.Remove("rotatedimage");
                Session.Remove("bwColorbytes");
            }
            else
            {
                Currrentimageinfo[5] = "0"; //Angle
                Session["Currrentimageinfo"] = Currrentimageinfo;
                string base64 = "";
                HttpPostedFile postedFile = FileUploadImage.PostedFile;
                Filename = Path.GetFileName(postedFile.FileName);
                FileExtenetion = Path.GetExtension(Filename);
                System.Drawing.Image image;
                Bitmap bitmapimg;
                byte[] bytes;
                //only image files is uploaded
                if (FileExtenetion.ToLower() == ".jpg" || FileExtenetion.ToLower() == ".jpeg" || FileExtenetion.ToLower() == ".bmp" || FileExtenetion.ToLower() == ".gif" || FileExtenetion.ToLower() == ".png")
                {

                    imgResize.Visible = true;
                    int Filesize = postedFile.ContentLength;
                    Stream stream = postedFile.InputStream;
                    BinaryReader binaryReader = new BinaryReader(stream);
                    bytes = binaryReader.ReadBytes((int)stream.Length);
                    image = System.Drawing.Image.FromStream(FileUploadImage.PostedFile.InputStream);
                    bitmapimg = new Bitmap(image);
                    Session["Currentimage"] = bitmapimg;
                    Session["orginalimage"] = bitmapimg;
                    Session["orginalbytes"] = bytes;
                    Session["Currentimgbytes"] = bytes;
                    int height = image.Height;
                    int width = image.Width;
                    Currrentimageinfo[2] = Filename;
                    Currrentimageinfo[3] = FileExtenetion;
                    double orgheight;
                    double orgwidth;
                    byte[] orginalbytes;
                    // Byte[] resizedbytes;

                    //if both height and width are same that means square images
                    if (image.Height == image.Width)
                    {
                        if (image.Height > 500)// if image is grater than 500 set to 500x500
                        {
                            orgheight = Convert.ToDouble(image.Height);
                            orgwidth = Convert.ToDouble(image.Width);
                            var dim = CalculateAspectratio(orgheight, orgwidth, 500, 500);
                            orginalbytes = (byte[])Session["orginalbytes"];
                            bytes = Resizeimage(orginalbytes, Convert.ToInt32(dim.Item1), Convert.ToInt32(dim.Item2));
                            image = byteArrayToImage(bytes);
                            bitmapimg = new Bitmap(image);

                            Session["Currentimgbytes"] = bytes;
                            base64 = Convert.ToBase64String(bytes);
                            imgResize.Height = Convert.ToInt32(dim.Item1);
                            imgResize.Width = Convert.ToInt32(dim.Item2);

                            Currrentimageinfo[0] = Convert.ToString(dim.Item1);
                            Currrentimageinfo[1] = Convert.ToString(dim.Item2);

                        }
                        else//less than 500x500px then show image as it is
                        {

                            Currrentimageinfo[0] = Convert.ToString(image.Height);
                            Currrentimageinfo[1] = Convert.ToString(image.Width);
                            imgResize.Height = image.Height;
                            imgResize.Width = image.Width;
                            base64 = Convert.ToBase64String(bytes);


                        }
                    }
                    else// images are rectangle other than square  here Item1-height and Item2-width
                    {

                        // if both height and width is more than 500 or any one is more than 500 then calculate  aspect ratio and  reduces its height and width to less than 500
                        if ((image.Height >= 500 && image.Width >= 500) || (image.Height <= 500 && image.Width >= 500) || (image.Height >= 500 && image.Width <= 500))
                        {
                            orgheight = Convert.ToDouble(image.Height);
                            orgwidth = Convert.ToDouble(image.Width);
                            var dim = CalculateAspectratio(orgheight, orgwidth, 500, 500);
                            orginalbytes = (byte[])Session["orginalbytes"];
                            bytes = Resizeimage(orginalbytes, Convert.ToInt32(dim.Item1), Convert.ToInt32(dim.Item2));
                            image = byteArrayToImage(bytes);
                            bitmapimg = new Bitmap(image);
                            Session["orginalbytes"] = bytes;
                            Session["Currentimgbytes"] = bytes;
                            base64 = Convert.ToBase64String(bytes);
                            imgResize.Height = Convert.ToInt32(dim.Item1);
                            imgResize.Width = Convert.ToInt32(dim.Item2);
                            Currrentimageinfo[0] = Convert.ToString(dim.Item1);
                            Currrentimageinfo[1] = Convert.ToString(dim.Item2);


                        }
                        else if (image.Height < 500 && image.Width < 500)// height and width are less than 500px
                        {
                            imgResize.Height = image.Height;
                            imgResize.Width = image.Width;
                            Currrentimageinfo[0] = Convert.ToString(image.Height);
                            Currrentimageinfo[1] = Convert.ToString(image.Width);
                            Session["orginalbytes"] = bytes;
                            Session["Currentimgbytes"] = bytes;
                            base64 = Convert.ToBase64String(bytes);
                            //imgResize.ImageUrl = "data:Image/png;base64," + base64;//showing image in image control

                        }

                    }
                    Session["Currentimage"] = bitmapimg;
                    imgResize.ImageUrl = "data:Image/png;base64," + base64;//display the image in image control  
                }
                else
                {

                    cstext1.Append("<script type=text/javascript> alert('Uploaded image should be in (.jpeg,.gif,.png,.bmp)!') </script>");
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "PopupScript", cstext1.ToString());


                }

            }

        }
        public static Bitmap MakeSpecialTransparent(Bitmap bmp)
        {
            // we expect a 32bpp bitmap!
            var bmpData = bmp.LockBits(new Rectangle(0, 0, bmp.Width, bmp.Height),
                                    ImageLockMode.ReadWrite, bmp.PixelFormat);

            long len = bmpData.Height * bmpData.Stride;
            byte[] data = new byte[len];
            Marshal.Copy(bmpData.Scan0, data, 0, data.Length);  

            for (int i = 0; i < len; i += 4)
            {
                if (data[i] == 0 && data[i + 1] == 0 && data[i + 2] == 0)
                {
                    data[i] = 0; data[i + 1] = 0; data[i + 2] = 0; data[i + 3] = 0;
                }
                else
                if (data[i] == 255 && data[i + 1] == 255 && data[i + 2] == 255)
                {
                    data[i] = 0; data[i + 1] = 0; data[i + 2] = 255; data[i + 3] = 0;
                }

            }
            Marshal.Copy(data, 0, bmpData.Scan0, data.Length);
            bmp.UnlockBits(bmpData);
            return bmp;
        }
        public static System.Drawing.Image PutOnCanvas(System.Drawing.Image image, int width, int height, Color canvasColor)
        {
            var res = new Bitmap(width, height);
            using (var g = Graphics.FromImage(res))
            {
                g.Clear(canvasColor);
                var x = (width - image.Width) / 2;
                var y = (height - image.Height) / 2;
                g.DrawImageUnscaled(image, x, y, image.Width, image.Height);
                
            }
            return res;
        }
        //whitebackground
        public byte[] ApplyWhiteBG(Bitmap source)
        {
            

            source.MakeTransparent();
            for (int x = 0; x < source.Width; x++)
            {
                for (int y = 0; y < source.Height; y++)
                {
                    Color currentColor = source.GetPixel(x, y);
                    if (currentColor.R >=220 && currentColor.G >=220 && currentColor.B >= 220)
                    {
                        source.SetPixel(x, y, Color.Transparent);
                    }
                    //else if(currentColor.R>=121 && currentColor.G>=117 && currentColor.B>=56)
                    //{

                    //    source.SetPixel(x, y, Color.Transparent);
                    //}
                  
                }
            }
            byte[] bwbytes = ImageToByteArray(source);
            return bwbytes;
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            byte[] bytes;
            bytes = (byte[])Session["Currentimgbytes"];

            System.Drawing.Image img = byteArrayToImage(bytes);
            //int w = img.Width;
            //int h = img.Height;
            Bitmap bitmapimg = new Bitmap(img);
            // System.Drawing.Image Canvasimg = PutOnCanvas(bitmapimg, 500, 500, System.Drawing.Color.White);
            // Bitmap Canvasimg = MakeSpecialTransparent(bitmapimg);
            //System.Drawing.Image img1 = Canvasimg;
            //bytes = GetTransparentArrayFromFileWithDelete(bitmapimg);
            bytes= ApplyWhiteBG(bitmapimg);
             //bytes = ImageToByteArray(img1);
            Session["Currentimgbytes"] = bytes;
            string  base64 = Convert.ToBase64String(bytes);
            imgResize.ImageUrl = "data:Image/png;base64," + base64;
        }

       
        //download
        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (Session["Currentimgbytes"] != null)
            {

                string extention;
                string filename;
                string filenamewithoutextention;

                if (Currrentimageinfo[6] == "1")
                {

                    extention = GetImageinfo(4);
                    filename = GetImageinfo(7);

                }
                else
                {
                    extention = GetImageinfo(3);
                    filename = GetImageinfo(2);
                    filenamewithoutextention = filename.Substring(0, filename.IndexOf("."));
                    filename = filenamewithoutextention + ".jpg";

                }

                byte[] bytes;
                bytes = (byte[])Session["Currentimgbytes"];
                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "";
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.ContentType = ".jpg"; ;
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename); //GetImageinfo(2) - filename
                Response.BinaryWrite(bytes); //be.Image
                Response.Flush();
                Response.End();
            }
            else
            {

                cstext1.Append("<script type=text/javascript> alert('Please Upload a file!') </script>");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "PopupScript", cstext1.ToString());

            }
        }
    }
}