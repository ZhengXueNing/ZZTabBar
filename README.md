# ZZTabBar

这是一个修改简化系统TabBar使用流程的Demo

大家直接导入Demo里面的TabBar文件夹，默认为ARC模式
只要引入 #import "ZZTabBar.h" 就可以在你的工程里面无障碍的使用

# 第一步
先调用 + (instancetype)sharedInstance:(NSString *)sNavigationControlls
               arrayController:(NSArray  *)arrayController;
sNavigationControlls 参数是指假如你使用的ViewController是不需要UINavigationControllls,那么你可以将这个参数传入 nil
假如你使用了系统的UINavigationControllls，那么你需要将『UINavigationControllls』作为字符串传入进去
假如你使用了自定义的UINavigationControllls，那么你也只需要将你自定义的UINavigationControllls的类名，已字符串形式传入进去

第二个arrayController参数也是同样的道理，只需要将你需要添加的UIViewController的类名已字符串形式，存在数组中，传入进去就OK

# 第二步
开发者需要修改TabBar Item 的哪个个属性，那么调用相对于的API就OK
具体API，请看Demo注释文档

# 第三步
开发者可以指定要将开始显示的视图，显示在页面上
开发者只需要调用 tabBar.iPage = 0; 给予对应的UIViewController下标就可以实现该功能

#第四步
开发者可以随意的给TabBar Item 附上标注，具体调用方法，详细请看Demo API
