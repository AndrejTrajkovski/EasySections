# EasySections
Tiny UITableView wrapper for easier handling of table view sections.

Using EasySections, you can declare your table view sections implementing the already familiar UITableViewDelegate and UITableViewDataSource methods. Then you can easily mix these sections in your implementation.
Here's how that looks like:
You make a subclass of AbstractSectionDelegate for each section in your table view.

```swift
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
```
And then in your controller just do:

```swift
redSectionDelegate = RedSectionDelegate.init(["Should", "I", "Stay", "Or", "Should", "I", "go"])
blueSectionDelegate = BlueSectionDelegate.init([10, 20, 30, 40, 50])
let delegates: [AbstractSectionDelegate] = [redSectionDelegate, blueSectionDelegate]
tableViewDelegate = MainTableViewDelegate.init(delegates)
tableView.delegate = tableViewDelegate
tableView.dataSource = tableViewDelegate
tableView.reloadData()
```
