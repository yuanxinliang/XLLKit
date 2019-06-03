import XCTest
import XLLKit

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // 把安装代码放在这里。此方法在调用类中的每个测试方法之前调用。
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        // 在这里写下拆卸代码。此方法在调用类中的每个测试方法之后调用。
        
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // 这是一个功能测试用例的例子。
        XCTAssert(true, "Pass")
    }
    
    func test001()
    {
        let b = "123456a".xl_isPassword()
        print(b)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        // 这是一个性能测试用例的例子。
        self.measure() {
            // Put the code you want to measure the time of here.
            // 把要测量时间的代码放在这里。
        }
    }
    
}
