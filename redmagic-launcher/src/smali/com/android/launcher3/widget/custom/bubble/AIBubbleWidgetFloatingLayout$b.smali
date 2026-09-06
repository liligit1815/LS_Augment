.class Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;
.super Ljava/lang/Object;
.source "AIBubbleWidgetFloatingLayout.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->m0(Landroid/content/Context;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Ljava/lang/String;

.field final synthetic h:Ljava/lang/String;

.field final synthetic i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;

.field final synthetic j:Ljava/lang/String;

.field final synthetic k:Landroid/content/Context;

.field final synthetic l:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;Ljava/lang/String;Ljava/lang/String;Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;Ljava/lang/String;Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->l:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->g:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->h:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->j:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p6, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->k:Landroid/content/Context;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public run()V
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v2

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v4, "queryAIModeService start contact="

    .line 13
    .line 14
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    iget-object v4, v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->g:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v4, ", queryKeyWord="

    .line 23
    .line 24
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    iget-object v5, v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->h:Ljava/lang/String;

    .line 28
    .line 29
    const-string v6, "\n"

    .line 30
    .line 31
    const-string v7, ";;;"

    .line 32
    .line 33
    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v5, "AIBubbleWidgetFloatingLayout"

    .line 45
    .line 46
    invoke-static {v5, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    const-string v0, "__KEYWORD__"

    .line 50
    .line 51
    iget-object v6, v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->h:Ljava/lang/String;

    .line 52
    .line 53
    const-string v7, "<s><|User|>\n\u8bf7\u5bf9\u5982\u4e0b\u7684\u591a\u6bb5\u804a\u5929\u5185\u5bb9\u8fdb\u884c\u603b\u7ed3\u6458\u8981\u4ee5\u4fbf\u4e8e\u63d0\u9192\u7528\u6237\u91cd\u8981\u4fe1\u606f\u3002\u8981\u6c42\uff1a\n- \u8bed\u4e49\u7406\u89e3\u6b63\u786e\uff0c\u6458\u8981\u7cbe\u7b80\uff0c\u5c3d\u53ef\u80fd\u77ed\u3002\n- \u6458\u8981\u5c3d\u91cf\u4f7f\u7528\u804a\u5929\u4e2d\u539f\u6709\u8bcd\u8bed\uff0c\u6db5\u76d6\u804a\u5929\u7684\u4e3b\u8981\u4fe1\u606f\u3002\n- \u65e0\u6548\u4fe1\u606f\u3001\u65e0\u7528\u804a\u5929\u5185\u5bb9\uff0c\u4e0d\u8981\u603b\u7ed3\u5230\u6458\u8981\u4e2d\u3002\n- \u7b97\u4e86\u3001\u53d6\u6d88\u4e86\u7684\u6574\u6bb5\u804a\u5929\u4e0d\u4fdd\u7559\u6458\u8981\u3002\n- \u8be6\u7ec6\u63cf\u8ff0\u6216\u8bf4\u660e\u53ef\u4ee5\u4e0d\u505a\u6458\u8981\u3002\n- \u6458\u8981\u7528\u53e5\u53f7\u4f5c\u7ed3\u5c3e\u3002\n- \u591a\u6bb5\u804a\u5929\u4e4b\u95f4\u9700\u8981\u67e5\u770b\u4e0a\u4e0b\u6587\uff0c\u5982\u679c\u76f8\u90bb\u591a\u6bb5\u804a\u5929\u4eba\u7269\u6216\u4e8b\u4ef6\u6709\u5173\uff0c\u5219\u5408\u5e76\u6458\u8981\uff0c\u5426\u5219\u7528\u5206\u53f7\u201c\uff1b\u201d\u5206\u5f00\u6458\u8981\u3002\n\u4ee5\u4e0b\u662f\u591a\u6bb5\u804a\u5929\u5185\u5bb9\uff0c\u4f7f\u7528\u6362\u884c\u7b26\u5206\u5272\u4e0d\u540c\u6bb5\uff1a\n__KEYWORD__</s>\n<s><|Assistant|>\n"

    .line 54
    .line 55
    invoke-virtual {v7, v0, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v10

    .line 59
    const/4 v6, 0x0

    .line 60
    const/4 v7, 0x0

    .line 61
    :try_start_0
    iget-object v0, v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->l:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 62
    .line 63
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->k(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)LL3/b;

    .line 64
    .line 65
    .line 66
    move-result-object v11

    .line 67
    const-string v12, "ModelDownloadingModel"

    .line 68
    .line 69
    const-string v13, "MessageDigest,\u6d88\u606f\u6458\u8981,0,8650"

    .line 70
    .line 71
    iget-object v0, v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->l:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 72
    .line 73
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->j(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)LL3/a;

    .line 74
    .line 75
    .line 76
    move-result-object v14

    .line 77
    const-string v15, "com.zte.mifavor.launcher"

    .line 78
    .line 79
    const/16 v16, 0x0

    .line 80
    .line 81
    invoke-interface/range {v11 .. v16}, LL3/b;->w(Ljava/lang/String;Ljava/lang/String;LL3/a;Ljava/lang/String;Z)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    new-instance v8, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 88
    .line 89
    .line 90
    const-string v9, "queryAIModeService downloadString="

    .line 91
    .line 92
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v8

    .line 102
    invoke-static {v5, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    const-string v8, "true"

    .line 106
    .line 107
    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_0

    .line 112
    .line 113
    iget-object v0, v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->l:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 114
    .line 115
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->k(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)LL3/b;

    .line 116
    .line 117
    .line 118
    move-result-object v8

    .line 119
    const-string v9, "QualLLMJNI"

    .line 120
    .line 121
    iget-object v0, v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->l:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 122
    .line 123
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->j(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;)LL3/a;

    .line 124
    .line 125
    .line 126
    move-result-object v11

    .line 127
    const-string v12, "com.zte.mifavor.launcher"

    .line 128
    .line 129
    const/4 v13, 0x1

    .line 130
    invoke-interface/range {v8 .. v13}, LL3/b;->w(Ljava/lang/String;Ljava/lang/String;LL3/a;Ljava/lang/String;Z)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v6

    .line 134
    goto :goto_0

    .line 135
    :catchall_0
    move-exception v0

    .line 136
    goto :goto_1

    .line 137
    :cond_0
    const/4 v7, 0x1

    .line 138
    :goto_0
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-nez v0, :cond_1

    .line 143
    .line 144
    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 148
    goto :goto_2

    .line 149
    :goto_1
    new-instance v8, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 152
    .line 153
    .line 154
    const-string v9, "queryAIModeService error, contact="

    .line 155
    .line 156
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    iget-object v9, v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->g:Ljava/lang/String;

    .line 160
    .line 161
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    iget-object v4, v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->h:Ljava/lang/String;

    .line 168
    .line 169
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v4

    .line 176
    invoke-static {v5, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 177
    .line 178
    .line 179
    :cond_1
    :goto_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 180
    .line 181
    .line 182
    move-result-wide v8

    .line 183
    new-instance v0, Ljava/lang/StringBuilder;

    .line 184
    .line 185
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 186
    .line 187
    .line 188
    const-string v4, "queryAIModeService hao="

    .line 189
    .line 190
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    sub-long/2addr v8, v2

    .line 194
    invoke-virtual {v0, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    const-string v2, "ms contact="

    .line 198
    .line 199
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    iget-object v2, v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;->g:Ljava/lang/String;

    .line 203
    .line 204
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    const-string v2, ", result="

    .line 208
    .line 209
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    invoke-static {v5, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    .line 221
    .line 222
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 223
    .line 224
    new-instance v2, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b$a;

    .line 225
    .line 226
    invoke-direct {v2, v1, v7, v6}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b$a;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$b;ZLjava/lang/String;)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 230
    .line 231
    .line 232
    return-void
.end method
