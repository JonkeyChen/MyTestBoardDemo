
/**
 
 Doucoments:
 
 Library:用于存在默认的设置
 Library/Coaches:应用不会在退出时删除的
 Library/Preferences:存储默认设置，如NSUserDefault
 
 temp:存储临时文件
 
 */
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //1.Home目录,即沙河目录
        var path = NSHomeDirectory();
        print("Home: \(path)")
        
        //2.Documents目录
        path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
        print("Documents:\(path)")
        
        //3.Library目录
        path = NSSearchPathForDirectoriesInDomains(.LibraryDirectory, .UserDomainMask, true).first!
        print("Library:\(path)")
        
        //4.Coches目录
        path = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true).first!
        print("Coches:\(path)")
        
        //5.temp目录
        path = NSTemporaryDirectory()
        print("temp:\(path)")
        
    }

}

