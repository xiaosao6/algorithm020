
class Solution {
    
    struct Location: Hashable {
        var x: Int
        var y: Int
        
        mutating func move_1_Step(on direction: Direction) {
            self = nextLocation(on: direction)
        }
        
        func nextLocation(on direction: Direction) -> Location {
            var loc = self
            loc.x += direction.move.x
            loc.y += direction.move.y
            return loc
        }
    }
    
    enum Direction: CaseIterable {
        case north
        case east
        case south
        case west
        
        var move: (x: Int, y: Int) { // 移动一步后,坐标的变化值
            switch self {
            case .north:    return (x:0, y:1)
            case .east:     return (x:1, y:0)
            case .south:    return (x:0, y:-1)
            case .west:     return (x:-1, y:0)
            }
        }
        
        mutating func turnLeft() {
            switch self {
            case .north:    self = .west
            case .east:     self = .north
            case .south:    self = .east
            case .west:     self = .south
            }
        }
        
        mutating func turnRight() {
            switch self {
            case .north:    self = .east
            case .east:     self = .south
            case .south:    self = .west
            case .west:     self = .north
            }
        }
    }
    
    func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        
        let obstacleSet = Set<Location>(obstacles.map{ Location(x: $0[0], y: $0[1]) }) // 障碍位置集合
        
        var result = 0
        
        var location = Location(x: 0, y: 0) // 机器人位置
        var direction = Direction.north // 机器人朝向
        
        for cmd in commands {
            switch cmd {
            case -2:
                direction.turnLeft() // 向左转 90 度
            case -1:
                direction.turnRight() // 向右转 90 度
            case 1...9: // 直走cmd个格子
                for _ in 0..<cmd {
                    let nextLocation = location.nextLocation(on: direction) // 下一步的坐标
                    if !obstacleSet.contains(nextLocation) { // 没有遇到障碍, 则执行走路
                        location.move_1_Step(on: direction)
                    }
                }
                let x = location.x
                let y = location.y
                result = max(result, (x*x) + (y*y))
            default: break
            }
        }
        return result
    }
}
