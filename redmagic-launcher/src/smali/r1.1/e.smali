.class public Lr1/e;
.super Landroid/animation/AnimatorListenerAdapter;
.source "InstallCompleteAnimatorListenerAdapter.java"


# instance fields
.field private g:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lr1/c;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lr1/c;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lr1/e;->g:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lr1/e;->g:Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    if-eqz p1, :cond_3

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    goto/16 :goto_2

    .line 15
    .line 16
    :cond_0
    iget-object p1, p0, Lr1/e;->g:Ljava/lang/ref/WeakReference;

    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lr1/c;

    .line 23
    .line 24
    invoke-virtual {p1}, Lr1/c;->G()V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lr1/e;->g:Ljava/lang/ref/WeakReference;

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Lr1/c;

    .line 34
    .line 35
    invoke-virtual {p1}, Lr1/c;->H()V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lr1/e;->g:Ljava/lang/ref/WeakReference;

    .line 39
    .line 40
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Lr1/c;

    .line 45
    .line 46
    iget-object p1, p1, Lr1/c;->T:Lcom/android/launcher3/model/data/I;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->W()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_3

    .line 53
    .line 54
    new-instance p1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    const-string v0, "si.title: "

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lr1/e;->g:Ljava/lang/ref/WeakReference;

    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Lr1/c;

    .line 71
    .line 72
    iget-object v0, v0, Lr1/c;->T:Lcom/android/launcher3/model/data/I;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v0, " si.getState(): "

    .line 80
    .line 81
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lr1/e;->g:Ljava/lang/ref/WeakReference;

    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Lr1/c;

    .line 91
    .line 92
    iget-object v0, v0, Lr1/c;->T:Lcom/android/launcher3/model/data/I;

    .line 93
    .line 94
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/I;->W()I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    const-string v0, "InstallDrawable"

    .line 106
    .line 107
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Lr1/e;->g:Ljava/lang/ref/WeakReference;

    .line 111
    .line 112
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    check-cast p1, Lr1/c;

    .line 117
    .line 118
    iget-object p1, p1, Lr1/c;->T:Lcom/android/launcher3/model/data/I;

    .line 119
    .line 120
    const/4 v1, 0x0

    .line 121
    invoke-virtual {p1, v1}, Lcom/android/launcher3/model/data/I;->g0(I)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Lr1/e;->g:Ljava/lang/ref/WeakReference;

    .line 125
    .line 126
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    check-cast p1, Lr1/c;

    .line 131
    .line 132
    iget-object p1, p1, Lr1/c;->T:Lcom/android/launcher3/model/data/I;

    .line 133
    .line 134
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 135
    .line 136
    invoke-virtual {p1, v1}, Lcom/android/launcher3/model/data/I;->f0(Ljava/lang/Boolean;)V

    .line 137
    .line 138
    .line 139
    iget-object p1, p0, Lr1/e;->g:Ljava/lang/ref/WeakReference;

    .line 140
    .line 141
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    check-cast p1, Lr1/c;

    .line 146
    .line 147
    iget-object p1, p1, Lr1/c;->T:Lcom/android/launcher3/model/data/I;

    .line 148
    .line 149
    const/16 v1, 0x64

    .line 150
    .line 151
    invoke-virtual {p1, v1}, Lcom/android/launcher3/model/data/I;->d0(I)V

    .line 152
    .line 153
    .line 154
    iget-object p1, p0, Lr1/e;->g:Ljava/lang/ref/WeakReference;

    .line 155
    .line 156
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    check-cast p1, Lr1/c;

    .line 161
    .line 162
    iget-object p1, p1, Lr1/c;->T:Lcom/android/launcher3/model/data/I;

    .line 163
    .line 164
    iget-object p1, p1, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 165
    .line 166
    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    if-eqz p1, :cond_1

    .line 171
    .line 172
    iget-object p1, p0, Lr1/e;->g:Ljava/lang/ref/WeakReference;

    .line 173
    .line 174
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    check-cast p1, Lr1/c;

    .line 179
    .line 180
    iget-object p1, p1, Lr1/c;->T:Lcom/android/launcher3/model/data/I;

    .line 181
    .line 182
    iget-object p1, p1, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 183
    .line 184
    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    goto :goto_0

    .line 193
    :cond_1
    iget-object p1, p0, Lr1/e;->g:Ljava/lang/ref/WeakReference;

    .line 194
    .line 195
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    check-cast p1, Lr1/c;

    .line 200
    .line 201
    iget-object p1, p1, Lr1/c;->T:Lcom/android/launcher3/model/data/I;

    .line 202
    .line 203
    iget-object p1, p1, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 204
    .line 205
    invoke-virtual {p1}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 210
    .line 211
    .line 212
    move-result v1

    .line 213
    if-nez v1, :cond_2

    .line 214
    .line 215
    iget-object v0, p0, Lr1/e;->g:Ljava/lang/ref/WeakReference;

    .line 216
    .line 217
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    check-cast v0, Lr1/c;

    .line 222
    .line 223
    iget-object v0, v0, Lr1/c;->S:Lcom/android/launcher3/BubbleTextView;

    .line 224
    .line 225
    invoke-virtual {v0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    invoke-static {v0, p1}, Lcom/android/launcher3/X0;->u(Landroid/content/Context;Ljava/lang/String;)V

    .line 230
    .line 231
    .line 232
    goto :goto_1

    .line 233
    :cond_2
    const-string p1, "workspaceItemInfo.getTargetComponent() == null"

    .line 234
    .line 235
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    .line 237
    .line 238
    :goto_1
    iget-object p1, p0, Lr1/e;->g:Ljava/lang/ref/WeakReference;

    .line 239
    .line 240
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    check-cast p1, Lr1/c;

    .line 245
    .line 246
    iget-object p1, p1, Lr1/c;->S:Lcom/android/launcher3/BubbleTextView;

    .line 247
    .line 248
    iget-object p0, p0, Lr1/e;->g:Ljava/lang/ref/WeakReference;

    .line 249
    .line 250
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 251
    .line 252
    .line 253
    move-result-object p0

    .line 254
    check-cast p0, Lr1/c;

    .line 255
    .line 256
    iget-object p0, p0, Lr1/c;->T:Lcom/android/launcher3/model/data/I;

    .line 257
    .line 258
    invoke-virtual {p1, p0}, Lcom/android/launcher3/BubbleTextView;->y(Lcom/android/launcher3/model/data/I;)V

    .line 259
    .line 260
    .line 261
    :cond_3
    :goto_2
    return-void
.end method
