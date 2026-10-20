package com.example.lab3

import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.RadioButton
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // 元件綁定
        val edName = findViewById<EditText>(R.id.ed_name)
        val tvText = findViewById<TextView>(R.id.tv_text)
        val tvName = findViewById<TextView>(R.id.tv_name)
        val tvWinner = findViewById<TextView>(R.id.tv_winner)
        val tvMmora = findViewById<TextView>(R.id.tv_mmora)
        val tvCmora = findViewById<TextView>(R.id.tv_cmora)

        val btnScissor = findViewById<RadioButton>(R.id.btn_scissor)
        val btnStone = findViewById<RadioButton>(R.id.btn_stone)
        val btnPaper = findViewById<RadioButton>(R.id.btn_paper)
        val btnMora = findViewById<Button>(R.id.btn_mora)

        btnMora.setOnClickListener {
            // 判斷玩家是否已輸入姓名
            if (edName.text.isEmpty()) {
                tvText.text = "請輸入玩家姓名"
                return@setOnClickListener
            }

            val playerName = edName.text.toString()
            tvName.text = "名字\n$playerName"

            // 判斷玩家出拳 (0: 剪刀, 1: 石頭, 2: 布)
            val playerChoice = when {
                btnScissor.isChecked -> 0
                btnStone.isChecked -> 1
                btnPaper.isChecked -> 2
                else -> 0
            }

            val moraOptions = arrayOf("剪刀", "石頭", "布")
            tvMmora.text = "我方出拳\n${moraOptions[playerChoice]}"

            // 電腦隨機出拳 (0~2)
            val computerChoice = (0..2).random()
            tvCmora.text = "電腦出拳\n${moraOptions[computerChoice]}"

            // 勝負判斷與結果顯示
            when {
                playerChoice == computerChoice -> {
                    tvWinner.text = "勝利者\n平手"
                    tvText.text = "平局，請再試一次！"
                }
                (playerChoice == 0 && computerChoice == 2) ||
                (playerChoice == 1 && computerChoice == 0) ||
                (playerChoice == 2 && computerChoice == 1) -> {
                    tvWinner.text = "勝利者\n$playerName"
                    tvText.text = "恭喜您贏了！！！"
                }
                else -> {
                    tvWinner.text = "勝利者\n電腦"
                    tvText.text = "可惜，電腦獲勝了！"
                }
            }
        }
    }
}
