.class public Landroidx/constraintlayout/motion/widget/r$b$a;
.super Ljava/lang/Object;
.source "MotionScene.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/motion/widget/r$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private final g:Landroidx/constraintlayout/motion/widget/r$b;

.field h:I

.field i:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroidx/constraintlayout/motion/widget/r$b;Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->h:I

    .line 6
    .line 7
    const/16 v0, 0x11

    .line 8
    .line 9
    iput v0, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->i:I

    .line 10
    .line 11
    iput-object p2, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->g:Landroidx/constraintlayout/motion/widget/r$b;

    .line 12
    .line 13
    invoke-static {p3}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    sget-object p3, Landroidx/constraintlayout/widget/i;->p8:[I

    .line 18
    .line 19
    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getIndexCount()I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    const/4 p3, 0x0

    .line 28
    :goto_0
    if-ge p3, p2, :cond_2

    .line 29
    .line 30
    invoke-virtual {p1, p3}, Landroid/content/res/TypedArray;->getIndex(I)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    sget v1, Landroidx/constraintlayout/widget/i;->r8:I

    .line 35
    .line 36
    if-ne v0, v1, :cond_0

    .line 37
    .line 38
    iget v1, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->h:I

    .line 39
    .line 40
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iput v0, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->h:I

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_0
    sget v1, Landroidx/constraintlayout/widget/i;->q8:I

    .line 48
    .line 49
    if-ne v0, v1, :cond_1

    .line 50
    .line 51
    iget v1, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->i:I

    .line 52
    .line 53
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iput v0, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->i:I

    .line 58
    .line 59
    :cond_1
    :goto_1
    add-int/lit8 p3, p3, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 63
    .line 64
    .line 65
    return-void
.end method


# virtual methods
.method public a(Landroidx/constraintlayout/motion/widget/p;ILandroidx/constraintlayout/motion/widget/r$b;)V
    .locals 6

    .line 1
    iget v0, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->h:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :goto_0
    if-nez p1, :cond_1

    .line 12
    .line 13
    new-instance p1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string p2, "OnClick could not find id "

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget p0, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->h:I

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p1, "MotionScene"

    .line 33
    .line 34
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    invoke-static {p3}, Landroidx/constraintlayout/motion/widget/r$b;->c(Landroidx/constraintlayout/motion/widget/r$b;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-static {p3}, Landroidx/constraintlayout/motion/widget/r$b;->a(Landroidx/constraintlayout/motion/widget/r$b;)I

    .line 43
    .line 44
    .line 45
    move-result p3

    .line 46
    if-ne v0, v1, :cond_2

    .line 47
    .line 48
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    iget v1, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->i:I

    .line 53
    .line 54
    and-int/lit8 v2, v1, 0x1

    .line 55
    .line 56
    const/4 v3, 0x0

    .line 57
    const/4 v4, 0x1

    .line 58
    if-eqz v2, :cond_3

    .line 59
    .line 60
    if-ne p2, v0, :cond_3

    .line 61
    .line 62
    move v2, v4

    .line 63
    goto :goto_1

    .line 64
    :cond_3
    move v2, v3

    .line 65
    :goto_1
    and-int/lit16 v5, v1, 0x100

    .line 66
    .line 67
    if-eqz v5, :cond_4

    .line 68
    .line 69
    if-ne p2, v0, :cond_4

    .line 70
    .line 71
    move v5, v4

    .line 72
    goto :goto_2

    .line 73
    :cond_4
    move v5, v3

    .line 74
    :goto_2
    or-int/2addr v2, v5

    .line 75
    and-int/lit8 v5, v1, 0x1

    .line 76
    .line 77
    if-eqz v5, :cond_5

    .line 78
    .line 79
    if-ne p2, v0, :cond_5

    .line 80
    .line 81
    move v0, v4

    .line 82
    goto :goto_3

    .line 83
    :cond_5
    move v0, v3

    .line 84
    :goto_3
    or-int/2addr v0, v2

    .line 85
    and-int/lit8 v2, v1, 0x10

    .line 86
    .line 87
    if-eqz v2, :cond_6

    .line 88
    .line 89
    if-ne p2, p3, :cond_6

    .line 90
    .line 91
    move v2, v4

    .line 92
    goto :goto_4

    .line 93
    :cond_6
    move v2, v3

    .line 94
    :goto_4
    or-int/2addr v0, v2

    .line 95
    and-int/lit16 v1, v1, 0x1000

    .line 96
    .line 97
    if-eqz v1, :cond_7

    .line 98
    .line 99
    if-ne p2, p3, :cond_7

    .line 100
    .line 101
    move v3, v4

    .line 102
    :cond_7
    or-int p2, v0, v3

    .line 103
    .line 104
    if-eqz p2, :cond_8

    .line 105
    .line 106
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 107
    .line 108
    .line 109
    :cond_8
    return-void
.end method

.method b(Landroidx/constraintlayout/motion/widget/r$b;Landroidx/constraintlayout/motion/widget/p;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->g:Landroidx/constraintlayout/motion/widget/r$b;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, p1, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-static {v0}, Landroidx/constraintlayout/motion/widget/r$b;->a(Landroidx/constraintlayout/motion/widget/r$b;)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->g:Landroidx/constraintlayout/motion/widget/r$b;

    .line 12
    .line 13
    invoke-static {p0}, Landroidx/constraintlayout/motion/widget/r$b;->c(Landroidx/constraintlayout/motion/widget/r$b;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/4 v0, -0x1

    .line 18
    const/4 v2, 0x0

    .line 19
    if-ne p0, v0, :cond_2

    .line 20
    .line 21
    iget p0, p2, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 22
    .line 23
    if-eq p0, p1, :cond_1

    .line 24
    .line 25
    return v1

    .line 26
    :cond_1
    return v2

    .line 27
    :cond_2
    iget p2, p2, Landroidx/constraintlayout/motion/widget/p;->l:I

    .line 28
    .line 29
    if-eq p2, p0, :cond_4

    .line 30
    .line 31
    if-ne p2, p1, :cond_3

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_3
    return v2

    .line 35
    :cond_4
    :goto_0
    return v1
.end method

.method public c(Landroidx/constraintlayout/motion/widget/p;)V
    .locals 2

    .line 1
    iget v0, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->h:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    new-instance p1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v0, " (*)  could not find id "

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget p0, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->h:I

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p1, "MotionScene"

    .line 33
    .line 34
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    const/4 p0, 0x0

    .line 39
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->g:Landroidx/constraintlayout/motion/widget/r$b;

    .line 2
    .line 3
    invoke-static {p1}, Landroidx/constraintlayout/motion/widget/r$b;->q(Landroidx/constraintlayout/motion/widget/r$b;)Landroidx/constraintlayout/motion/widget/r;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Landroidx/constraintlayout/motion/widget/r;->d(Landroidx/constraintlayout/motion/widget/r;)Landroidx/constraintlayout/motion/widget/p;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/p;->y()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto/16 :goto_5

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->g:Landroidx/constraintlayout/motion/widget/r$b;

    .line 20
    .line 21
    invoke-static {v0}, Landroidx/constraintlayout/motion/widget/r$b;->c(Landroidx/constraintlayout/motion/widget/r$b;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, -0x1

    .line 26
    if-ne v0, v1, :cond_2

    .line 27
    .line 28
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/p;->getCurrentState()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-ne v0, v1, :cond_1

    .line 33
    .line 34
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->g:Landroidx/constraintlayout/motion/widget/r$b;

    .line 35
    .line 36
    invoke-static {p0}, Landroidx/constraintlayout/motion/widget/r$b;->a(Landroidx/constraintlayout/motion/widget/r$b;)I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    invoke-virtual {p1, p0}, Landroidx/constraintlayout/motion/widget/p;->J(I)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    new-instance v1, Landroidx/constraintlayout/motion/widget/r$b;

    .line 45
    .line 46
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->g:Landroidx/constraintlayout/motion/widget/r$b;

    .line 47
    .line 48
    invoke-static {v2}, Landroidx/constraintlayout/motion/widget/r$b;->q(Landroidx/constraintlayout/motion/widget/r$b;)Landroidx/constraintlayout/motion/widget/r;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->g:Landroidx/constraintlayout/motion/widget/r$b;

    .line 53
    .line 54
    invoke-direct {v1, v2, v3}, Landroidx/constraintlayout/motion/widget/r$b;-><init>(Landroidx/constraintlayout/motion/widget/r;Landroidx/constraintlayout/motion/widget/r$b;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v1, v0}, Landroidx/constraintlayout/motion/widget/r$b;->d(Landroidx/constraintlayout/motion/widget/r$b;I)I

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->g:Landroidx/constraintlayout/motion/widget/r$b;

    .line 61
    .line 62
    invoke-static {p0}, Landroidx/constraintlayout/motion/widget/r$b;->a(Landroidx/constraintlayout/motion/widget/r$b;)I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    invoke-static {v1, p0}, Landroidx/constraintlayout/motion/widget/r$b;->b(Landroidx/constraintlayout/motion/widget/r$b;I)I

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, v1}, Landroidx/constraintlayout/motion/widget/p;->setTransition(Landroidx/constraintlayout/motion/widget/r$b;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/p;->G()V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_2
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->g:Landroidx/constraintlayout/motion/widget/r$b;

    .line 77
    .line 78
    invoke-static {v0}, Landroidx/constraintlayout/motion/widget/r$b;->q(Landroidx/constraintlayout/motion/widget/r$b;)Landroidx/constraintlayout/motion/widget/r;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget-object v0, v0, Landroidx/constraintlayout/motion/widget/r;->c:Landroidx/constraintlayout/motion/widget/r$b;

    .line 83
    .line 84
    iget v1, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->i:I

    .line 85
    .line 86
    and-int/lit8 v2, v1, 0x1

    .line 87
    .line 88
    const/4 v3, 0x0

    .line 89
    const/4 v4, 0x1

    .line 90
    if-nez v2, :cond_4

    .line 91
    .line 92
    and-int/lit16 v2, v1, 0x100

    .line 93
    .line 94
    if-eqz v2, :cond_3

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_3
    move v2, v3

    .line 98
    goto :goto_1

    .line 99
    :cond_4
    :goto_0
    move v2, v4

    .line 100
    :goto_1
    and-int/lit8 v5, v1, 0x10

    .line 101
    .line 102
    if-nez v5, :cond_6

    .line 103
    .line 104
    and-int/lit16 v1, v1, 0x1000

    .line 105
    .line 106
    if-eqz v1, :cond_5

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_5
    move v1, v3

    .line 110
    goto :goto_3

    .line 111
    :cond_6
    :goto_2
    move v1, v4

    .line 112
    :goto_3
    if-eqz v2, :cond_9

    .line 113
    .line 114
    if-eqz v1, :cond_9

    .line 115
    .line 116
    iget-object v5, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->g:Landroidx/constraintlayout/motion/widget/r$b;

    .line 117
    .line 118
    invoke-static {v5}, Landroidx/constraintlayout/motion/widget/r$b;->q(Landroidx/constraintlayout/motion/widget/r$b;)Landroidx/constraintlayout/motion/widget/r;

    .line 119
    .line 120
    .line 121
    move-result-object v5

    .line 122
    iget-object v5, v5, Landroidx/constraintlayout/motion/widget/r;->c:Landroidx/constraintlayout/motion/widget/r$b;

    .line 123
    .line 124
    iget-object v6, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->g:Landroidx/constraintlayout/motion/widget/r$b;

    .line 125
    .line 126
    if-eq v5, v6, :cond_7

    .line 127
    .line 128
    invoke-virtual {p1, v6}, Landroidx/constraintlayout/motion/widget/p;->setTransition(Landroidx/constraintlayout/motion/widget/r$b;)V

    .line 129
    .line 130
    .line 131
    :cond_7
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/p;->getCurrentState()I

    .line 132
    .line 133
    .line 134
    move-result v5

    .line 135
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/p;->getEndState()I

    .line 136
    .line 137
    .line 138
    move-result v6

    .line 139
    if-eq v5, v6, :cond_a

    .line 140
    .line 141
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/p;->getProgress()F

    .line 142
    .line 143
    .line 144
    move-result v5

    .line 145
    const/high16 v6, 0x3f000000    # 0.5f

    .line 146
    .line 147
    cmpl-float v5, v5, v6

    .line 148
    .line 149
    if-lez v5, :cond_8

    .line 150
    .line 151
    goto :goto_4

    .line 152
    :cond_8
    move v1, v3

    .line 153
    :cond_9
    move v3, v2

    .line 154
    :cond_a
    :goto_4
    invoke-virtual {p0, v0, p1}, Landroidx/constraintlayout/motion/widget/r$b$a;->b(Landroidx/constraintlayout/motion/widget/r$b;Landroidx/constraintlayout/motion/widget/p;)Z

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    if-eqz v0, :cond_e

    .line 159
    .line 160
    if-eqz v3, :cond_b

    .line 161
    .line 162
    iget v0, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->i:I

    .line 163
    .line 164
    and-int/2addr v0, v4

    .line 165
    if-eqz v0, :cond_b

    .line 166
    .line 167
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->g:Landroidx/constraintlayout/motion/widget/r$b;

    .line 168
    .line 169
    invoke-virtual {p1, p0}, Landroidx/constraintlayout/motion/widget/p;->setTransition(Landroidx/constraintlayout/motion/widget/r$b;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/p;->G()V

    .line 173
    .line 174
    .line 175
    return-void

    .line 176
    :cond_b
    if-eqz v1, :cond_c

    .line 177
    .line 178
    iget v0, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->i:I

    .line 179
    .line 180
    and-int/lit8 v0, v0, 0x10

    .line 181
    .line 182
    if-eqz v0, :cond_c

    .line 183
    .line 184
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->g:Landroidx/constraintlayout/motion/widget/r$b;

    .line 185
    .line 186
    invoke-virtual {p1, p0}, Landroidx/constraintlayout/motion/widget/p;->setTransition(Landroidx/constraintlayout/motion/widget/r$b;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/p;->I()V

    .line 190
    .line 191
    .line 192
    return-void

    .line 193
    :cond_c
    if-eqz v3, :cond_d

    .line 194
    .line 195
    iget v0, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->i:I

    .line 196
    .line 197
    and-int/lit16 v0, v0, 0x100

    .line 198
    .line 199
    if-eqz v0, :cond_d

    .line 200
    .line 201
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->g:Landroidx/constraintlayout/motion/widget/r$b;

    .line 202
    .line 203
    invoke-virtual {p1, p0}, Landroidx/constraintlayout/motion/widget/p;->setTransition(Landroidx/constraintlayout/motion/widget/r$b;)V

    .line 204
    .line 205
    .line 206
    const/high16 p0, 0x3f800000    # 1.0f

    .line 207
    .line 208
    invoke-virtual {p1, p0}, Landroidx/constraintlayout/motion/widget/p;->setProgress(F)V

    .line 209
    .line 210
    .line 211
    return-void

    .line 212
    :cond_d
    if-eqz v1, :cond_e

    .line 213
    .line 214
    iget v0, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->i:I

    .line 215
    .line 216
    and-int/lit16 v0, v0, 0x1000

    .line 217
    .line 218
    if-eqz v0, :cond_e

    .line 219
    .line 220
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/r$b$a;->g:Landroidx/constraintlayout/motion/widget/r$b;

    .line 221
    .line 222
    invoke-virtual {p1, p0}, Landroidx/constraintlayout/motion/widget/p;->setTransition(Landroidx/constraintlayout/motion/widget/r$b;)V

    .line 223
    .line 224
    .line 225
    const/4 p0, 0x0

    .line 226
    invoke-virtual {p1, p0}, Landroidx/constraintlayout/motion/widget/p;->setProgress(F)V

    .line 227
    .line 228
    .line 229
    :cond_e
    :goto_5
    return-void
.end method
