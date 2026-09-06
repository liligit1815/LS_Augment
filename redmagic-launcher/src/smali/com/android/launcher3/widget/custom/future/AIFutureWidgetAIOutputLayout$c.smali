.class Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$c;
.super Ljava/lang/Object;
.source "AIFutureWidgetAIOutputLayout.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$c;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$c;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->d(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$c;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->e(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$c;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 20
    .line 21
    invoke-static {v1}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->d(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-ge v0, v1, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$c;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->a(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$c;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 43
    .line 44
    invoke-static {v2}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->a(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v2, ""

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$c;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 61
    .line 62
    invoke-static {v2}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->d(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$c;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 67
    .line 68
    invoke-static {v3}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->e(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)I

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$c;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 87
    .line 88
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->e(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    add-int/lit8 v1, v1, 0x1

    .line 93
    .line 94
    invoke-static {v0, v1}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->h(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;I)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$c;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 98
    .line 99
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->c(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-nez v0, :cond_0

    .line 104
    .line 105
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$c;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 106
    .line 107
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->g(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_0

    .line 112
    .line 113
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$c;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 114
    .line 115
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->f(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)Landroid/widget/ScrollView;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    const/16 v1, 0x82

    .line 120
    .line 121
    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->fullScroll(I)Z

    .line 122
    .line 123
    .line 124
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$c;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 125
    .line 126
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->b(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)Landroid/os/Handler;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    const-wide/16 v1, 0x1e

    .line 131
    .line 132
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 137
    .line 138
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 139
    .line 140
    .line 141
    const-string v1, "mTextAnimRunnable run clearTextAnim mNeedAddTextIndex="

    .line 142
    .line 143
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$c;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 147
    .line 148
    invoke-static {v1}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->e(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)I

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    const-string v1, " isEmpty="

    .line 156
    .line 157
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$c;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 161
    .line 162
    invoke-static {v1}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->d(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    xor-int/lit8 v1, v1, 0x1

    .line 171
    .line 172
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    const-string v1, "AIFutureWidgetAIOutputLayout"

    .line 180
    .line 181
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    .line 183
    .line 184
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout$c;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 185
    .line 186
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;->j(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;)V

    .line 187
    .line 188
    .line 189
    return-void
.end method
