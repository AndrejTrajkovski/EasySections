#
#  Be sure to run `pod spec lint EasySections.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "EasySections"
  s.version      = "0.1.0"
  s.summary      = "Easy Sections is a tiny wrapper around UITableView which makes working with reocurring sections easier."
  s.description  = <<-DESC
Using EasySections, you can declare your table view sections implementing the already familiar UITableViewDelegate and UITableViewDataSource methods. Then you can easily mix these sections in your implementation.
Here's how that looks like:
You make a subclass of AbstractSectionDelegate for each section in your table view.

class BlueSectionDelegate: AbstractSectionDelegate {

var array: [Int]

init(_ array: [Int]) {
self.array = array
super.init()
}

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
return self.array.count
}

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
var blueCell = tableView.dequeueReusableCell(withIdentifier: "blueCell")
if blueCell == nil {
blueCell = UITableViewCell.init(style: .default, reuseIdentifier: "blueCell")
}
blueCell?.backgroundColor = .blue
blueCell?.textLabel?.text = String(array[indexPath.row])
return blueCell!
}
}

class RedSectionDelegate: AbstractSectionDelegate {

var array: [String]

init(_ array: [String]) {
self.array = array
super.init()
}

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
return array.count
}

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
var redCell = tableView.dequeueReusableCell(withIdentifier: "redCell")
if redCell == nil {
redCell = UITableViewCell.init(style: .default, reuseIdentifier: "redCell")
}
redCell?.backgroundColor = .red
redCell?.textLabel?.text = array[indexPath.row]
return redCell!
}

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
return CGFloat((indexPath.row + 1) * 40)
}
}

And then in your controller just do:
redSectionDelegate = RedSectionDelegate.init(["Should", "I", "Stay", "Or", "Should", "I", "go"])
blueSectionDelegate = BlueSectionDelegate.init([10, 20, 30, 40, 50])
let delegates: [AbstractSectionDelegate] = [redSectionDelegate, blueSectionDelegate]
tableViewDelegate = MainTableViewDelegate.init(delegates)
tableView.delegate = tableViewDelegate
tableView.dataSource = tableViewDelegate
tableView.reloadData()
                   DESC

  s.homepage     = "https://github.com/AndrejTrajkovski/EasySections"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "AndrejTrajkovski" => "andrej.trajkovski@hotmail.com" }  
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/AndrejTrajkovski/EasySections.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #
  s.source_files = "EasySections/**/*.{swift}"
  s.swift_version = "5.0"

end
