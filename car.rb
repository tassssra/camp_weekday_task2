class Car
  # 定数を追加
  UP_SPEED = 10
  DOWN_SPEED = 20
  # 定数 MAX_PASSENGERS を追加 (課題2-3)
  MAX_PASSENGERS = 4

  @@count = 0
  attr_accessor :number, :color, :passengers # :passengersを追加 (課題2-3)
  # speedは外部から設定しないのでreaderで定義
  # @speedが使えるようになる
  attr_reader :speed

  def initialize(number, color) # initializeメソッドにpassengersを追加
    @number = number
    @color = color
    # @speedを初期化
    @speed = 0
    @@count += 1
    @passengers = 1 # Carクラスのインスタンス生成時に、passengersに1を追加 (課題2-3)
  end

  # 加速用のメソッド追加
  def speed_up
    @speed += UP_SPEED

    # 30以上でアラート表示。50以上でアラート表示の上、20減速するif文を追加。 (課題2-1)
    if @speed >= 50
      puts "[ALERT]スピードが#{@speed}になりました。減速します。"
      speed_down # speed_downメソッドを呼び出す
    elsif @speed >= 30
      puts "[ALERT]スピードが#{@speed}になりました。"
    end
  end

  # 減速用のメソッド追加
  def speed_down
    # ifの結果を変数に代入する場合は以下の記述でOK
    @speed = if @speed - DOWN_SPEED < 0
               0
             else
               @speed - DOWN_SPEED
             end
  end

  # get_onメソッドを追加。4人以上になると乗車できなくなる仕様。 (課題2-3)
  def get_on
    if @passengers >= MAX_PASSENGERS # MAX_PASSENGERS == 4
      puts "乗車できません。この車の最大乗車人数は#{MAX_PASSENGERS}人です。"
    else
      @passengers += 1 # passengersに1を追加
      puts "乗車しました。"
    end
  end

  def self.count
    @@count  # return @@countの略
  end

  # count_infoクラスメソッドを追加 (課題2-4)
  def self.count_info
    "Carクラスのクラス変数@@countは#{@@count}です。"
  end

end


# Carクラスを継承したTrackCarクラスを追加 (課題2-2)
class TrackCar < Car
  attr_reader :load_weight

  def initialize(number, color, load_weight = 500)
    # 今後TrackCarクラスでnumber, colorが使えるようにCarクラスのinitializeメソッドを継承
    super(number, color)
    @load_weight = load_weight
  end
end
