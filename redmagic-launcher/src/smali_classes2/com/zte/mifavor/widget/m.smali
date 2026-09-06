.class public Lcom/zte/mifavor/widget/m;
.super Ljava/lang/Object;
.source "LoadingToast.java"


# static fields
.field private static o:Lcom/zte/mifavor/widget/m;


# instance fields
.field private final a:Landroid/os/Handler;

.field private final b:Landroid/view/WindowManager$LayoutParams;

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:F

.field private h:F

.field private i:Landroid/view/View;

.field private j:Landroid/view/View;

.field private k:Landroid/content/Context;

.field private l:Landroid/view/WindowManager;

.field private final m:Ljava/lang/Runnable;

.field private final n:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Handler;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/zte/mifavor/widget/m;->a:Landroid/os/Handler;

    .line 10
    .line 11
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/zte/mifavor/widget/m;->b:Landroid/view/WindowManager$LayoutParams;

    .line 17
    .line 18
    const/16 v0, 0x51

    .line 19
    .line 20
    iput v0, p0, Lcom/zte/mifavor/widget/m;->d:I

    .line 21
    .line 22
    new-instance v0, Lcom/zte/mifavor/widget/m$a;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Lcom/zte/mifavor/widget/m$a;-><init>(Lcom/zte/mifavor/widget/m;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/zte/mifavor/widget/m;->m:Ljava/lang/Runnable;

    .line 28
    .line 29
    new-instance v0, Lcom/zte/mifavor/widget/m$b;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Lcom/zte/mifavor/widget/m$b;-><init>(Lcom/zte/mifavor/widget/m;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/zte/mifavor/widget/m;->n:Ljava/lang/Runnable;

    .line 35
    .line 36
    iput-object p1, p0, Lcom/zte/mifavor/widget/m;->k:Landroid/content/Context;

    .line 37
    .line 38
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/m;->h(Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method static bridge synthetic a(Lcom/zte/mifavor/widget/m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/mifavor/widget/m;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic b(Lcom/zte/mifavor/widget/m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/mifavor/widget/m;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static d(Landroid/content/Context;)Lcom/zte/mifavor/widget/m;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/zte/mifavor/widget/m;->o:Lcom/zte/mifavor/widget/m;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Lcom/zte/mifavor/widget/m;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Lcom/zte/mifavor/widget/m;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/zte/mifavor/widget/m;->o:Lcom/zte/mifavor/widget/m;

    .line 15
    .line 16
    :cond_0
    sget-object p0, Lcom/zte/mifavor/widget/m;->o:Lcom/zte/mifavor/widget/m;

    .line 17
    .line 18
    return-object p0
.end method

.method private f()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/m;->i:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/zte/mifavor/widget/m;->l:Landroid/view/WindowManager;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/zte/mifavor/widget/m;->i:Landroid/view/View;

    .line 14
    .line 15
    invoke-interface {v0, v1}, Landroid/view/WindowManager;->removeViewImmediate(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/zte/mifavor/widget/m;->i:Landroid/view/View;

    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method private g()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/m;->i:Landroid/view/View;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/zte/mifavor/widget/m;->j:Landroid/view/View;

    .line 4
    .line 5
    const-string v2, "LoadingToast"

    .line 6
    .line 7
    if-eq v0, v1, :cond_2

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/zte/mifavor/widget/m;->f()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/zte/mifavor/widget/m;->j:Landroid/view/View;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/zte/mifavor/widget/m;->i:Landroid/view/View;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget v1, p0, Lcom/zte/mifavor/widget/m;->d:I

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/content/res/Configuration;->getLayoutDirection()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-static {v1, v0}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iget-object v1, p0, Lcom/zte/mifavor/widget/m;->b:Landroid/view/WindowManager$LayoutParams;

    .line 39
    .line 40
    iput v0, v1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 41
    .line 42
    and-int/lit8 v3, v0, 0x7

    .line 43
    .line 44
    const/high16 v4, 0x3f800000    # 1.0f

    .line 45
    .line 46
    const/4 v5, 0x7

    .line 47
    if-ne v3, v5, :cond_0

    .line 48
    .line 49
    iput v4, v1, Landroid/view/WindowManager$LayoutParams;->horizontalWeight:F

    .line 50
    .line 51
    :cond_0
    const/16 v3, 0x70

    .line 52
    .line 53
    and-int/2addr v0, v3

    .line 54
    if-ne v0, v3, :cond_1

    .line 55
    .line 56
    iput v4, v1, Landroid/view/WindowManager$LayoutParams;->verticalWeight:F

    .line 57
    .line 58
    :cond_1
    iget v0, p0, Lcom/zte/mifavor/widget/m;->e:I

    .line 59
    .line 60
    iput v0, v1, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 61
    .line 62
    iget v0, p0, Lcom/zte/mifavor/widget/m;->f:I

    .line 63
    .line 64
    iput v0, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 65
    .line 66
    iget v0, p0, Lcom/zte/mifavor/widget/m;->h:F

    .line 67
    .line 68
    iput v0, v1, Landroid/view/WindowManager$LayoutParams;->verticalMargin:F

    .line 69
    .line 70
    iget v0, p0, Lcom/zte/mifavor/widget/m;->g:F

    .line 71
    .line 72
    iput v0, v1, Landroid/view/WindowManager$LayoutParams;->horizontalMargin:F

    .line 73
    .line 74
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    const-string v1, "handle Show x="

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget-object v1, p0, Lcom/zte/mifavor/widget/m;->b:Landroid/view/WindowManager$LayoutParams;

    .line 85
    .line 86
    iget v1, v1, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v1, "y="

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    iget-object v1, p0, Lcom/zte/mifavor/widget/m;->b:Landroid/view/WindowManager$LayoutParams;

    .line 97
    .line 98
    iget v1, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, "width="

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget-object v1, p0, Lcom/zte/mifavor/widget/m;->b:Landroid/view/WindowManager$LayoutParams;

    .line 109
    .line 110
    iget v1, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v1, "height="

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    iget-object v1, p0, Lcom/zte/mifavor/widget/m;->b:Landroid/view/WindowManager$LayoutParams;

    .line 121
    .line 122
    iget v1, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 123
    .line 124
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    const-string v1, ", mView="

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    iget-object v1, p0, Lcom/zte/mifavor/widget/m;->i:Landroid/view/View;

    .line 133
    .line 134
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    const-string v1, ", mParams="

    .line 138
    .line 139
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    iget-object v1, p0, Lcom/zte/mifavor/widget/m;->b:Landroid/view/WindowManager$LayoutParams;

    .line 143
    .line 144
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string v1, ", mWM="

    .line 148
    .line 149
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    iget-object v1, p0, Lcom/zte/mifavor/widget/m;->l:Landroid/view/WindowManager;

    .line 153
    .line 154
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    .line 163
    .line 164
    iget-object v0, p0, Lcom/zte/mifavor/widget/m;->l:Landroid/view/WindowManager;

    .line 165
    .line 166
    iget-object v1, p0, Lcom/zte/mifavor/widget/m;->i:Landroid/view/View;

    .line 167
    .line 168
    iget-object p0, p0, Lcom/zte/mifavor/widget/m;->b:Landroid/view/WindowManager$LayoutParams;

    .line 169
    .line 170
    invoke-interface {v0, v1, p0}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 171
    .line 172
    .line 173
    goto :goto_0

    .line 174
    :catch_0
    move-exception p0

    .line 175
    new-instance v0, Ljava/lang/StringBuilder;

    .line 176
    .line 177
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 178
    .line 179
    .line 180
    const-string v1, "handle Show Exception :"

    .line 181
    .line 182
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    invoke-static {v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 193
    .line 194
    .line 195
    :goto_0
    return-void

    .line 196
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 197
    .line 198
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 199
    .line 200
    .line 201
    const-string v1, "handle Show mView="

    .line 202
    .line 203
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    iget-object v1, p0, Lcom/zte/mifavor/widget/m;->i:Landroid/view/View;

    .line 207
    .line 208
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    const-string v1, ", mNextView="

    .line 212
    .line 213
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    iget-object p0, p0, Lcom/zte/mifavor/widget/m;->j:Landroid/view/View;

    .line 217
    .line 218
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    invoke-static {v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    .line 227
    .line 228
    return-void
.end method

.method private h(Landroid/content/Context;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/m;->b:Landroid/view/WindowManager$LayoutParams;

    .line 2
    .line 3
    const/4 v1, -0x2

    .line 4
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 5
    .line 6
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 7
    .line 8
    const/16 v1, 0xa8

    .line 9
    .line 10
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 11
    .line 12
    const/4 v1, -0x3

    .line 13
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->format:I

    .line 14
    .line 15
    sget v1, LR3/l;->a:I

    .line 16
    .line 17
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    .line 18
    .line 19
    const/16 v1, 0x7f6

    .line 20
    .line 21
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 22
    .line 23
    const-string v1, "Toast"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/view/WindowManager$LayoutParams;->setTitle(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string v0, "window"

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Landroid/view/WindowManager;

    .line 39
    .line 40
    iput-object p1, p0, Lcom/zte/mifavor/widget/m;->l:Landroid/view/WindowManager;

    .line 41
    .line 42
    const/4 p1, 0x0

    .line 43
    iput p1, p0, Lcom/zte/mifavor/widget/m;->f:I

    .line 44
    .line 45
    return-void
.end method

.method public static i(Landroid/content/Context;Ljava/lang/CharSequence;I)Lcom/zte/mifavor/widget/m;
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/zte/mifavor/widget/m;->d(Landroid/content/Context;)Lcom/zte/mifavor/widget/m;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "layout_inflater"

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Landroid/view/LayoutInflater;

    .line 16
    .line 17
    sget v1, LR3/i;->u:I

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {p0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const v1, 0x102000b

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Landroid/widget/TextView;

    .line 32
    .line 33
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p0}, Lcom/zte/mifavor/widget/m;->j(Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    iput-object p0, v0, Lcom/zte/mifavor/widget/m;->j:Landroid/view/View;

    .line 40
    .line 41
    iput p2, v0, Lcom/zte/mifavor/widget/m;->c:I

    .line 42
    .line 43
    return-object v0
.end method


# virtual methods
.method public c()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/m;->a:Landroid/os/Handler;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/zte/mifavor/widget/m;->n:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/zte/mifavor/widget/m;->a:Landroid/os/Handler;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/zte/mifavor/widget/m;->n:Ljava/lang/Runnable;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public e()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/m;->j:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/m;->j:Landroid/view/View;

    .line 2
    .line 3
    return-void
.end method

.method public k()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/m;->a:Landroid/os/Handler;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/zte/mifavor/widget/m;->m:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/zte/mifavor/widget/m;->a:Landroid/os/Handler;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/zte/mifavor/widget/m;->n:Ljava/lang/Runnable;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/zte/mifavor/widget/m;->a:Landroid/os/Handler;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/zte/mifavor/widget/m;->n:Ljava/lang/Runnable;

    .line 18
    .line 19
    iget p0, p0, Lcom/zte/mifavor/widget/m;->c:I

    .line 20
    .line 21
    int-to-long v2, p0

    .line 22
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 23
    .line 24
    .line 25
    return-void
.end method
