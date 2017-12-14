using MicroMsg.sdk;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Navigation;
using Windows.Phone.Storage.SharedAccess;
using Windows.Storage;

namespace SDK_Demo
{
    //UriMapperBase继承类，主要逻辑是，判断是微信请求或响应过来后，导向到DemoEntryPage
    class AssociationUriMapper : UriMapperBase
    {
        public override Uri MapUri(Uri uri)
        {
            string tempUri = uri.ToString();

            // 根据文件类型打开程序
            if (tempUri.Contains("/FileTypeAssociation"))
            {
                // 获取fileID (after "fileToken=").
                int fileIDIndex = tempUri.IndexOf("fileToken=") + 10;
                string fileID = tempUri.Substring(fileIDIndex);

                // 获取文件名.
                string incommingFileName = SharedStorageAccessManager.GetSharedFileName(fileID);

                // 获取文件后缀
                int extensionIndex = incommingFileName.LastIndexOf('.') + 1;
                string incommingFileType = incommingFileName.Substring(extensionIndex).ToLower();

                // 根据不同文件类型，跳转不同参数的地址
                switch (incommingFileType)
                {
                    case ConstString.APPID:
                        //fileToken参数名不要改，就用这个，不然取不到数据
                        return new Uri("/DemoEntryPage.xaml?fileToken=" + fileID, UriKind.Relative);
                    default:
                        return new Uri("/MainPage.xaml", UriKind.Relative);
                }
            }
            else
            {
                return uri;
            }
        }
    }
}
