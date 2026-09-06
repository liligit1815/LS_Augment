.class public Landroidx/constraintlayout/widget/k;
.super Ljava/lang/Object;
.source "StateSet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/widget/k$a;,
        Landroidx/constraintlayout/widget/k$b;
    }
.end annotation


# instance fields
.field a:I

.field b:I

.field c:I

.field private d:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroidx/constraintlayout/widget/k$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Landroidx/constraintlayout/widget/k;->a:I

    .line 6
    .line 7
    iput v0, p0, Landroidx/constraintlayout/widget/k;->b:I

    .line 8
    .line 9
    iput v0, p0, Landroidx/constraintlayout/widget/k;->c:I

    .line 10
    .line 11
    new-instance v0, Landroid/util/SparseArray;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Landroidx/constraintlayout/widget/k;->d:Landroid/util/SparseArray;

    .line 17
    .line 18
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/k;->b(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private b(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 10

    .line 1
    const-string v0, "Error parsing XML resource"

    .line 2
    .line 3
    const-string v1, "ConstraintLayoutStates"

    .line 4
    .line 5
    invoke-static {p2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    sget-object v3, Landroidx/constraintlayout/widget/i;->U8:[I

    .line 10
    .line 11
    invoke-virtual {p1, v2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->getIndexCount()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    const/4 v4, 0x0

    .line 20
    move v5, v4

    .line 21
    :goto_0
    if-ge v5, v3, :cond_1

    .line 22
    .line 23
    invoke-virtual {v2, v5}, Landroid/content/res/TypedArray;->getIndex(I)I

    .line 24
    .line 25
    .line 26
    move-result v6

    .line 27
    sget v7, Landroidx/constraintlayout/widget/i;->V8:I

    .line 28
    .line 29
    if-ne v6, v7, :cond_0

    .line 30
    .line 31
    iget v7, p0, Landroidx/constraintlayout/widget/k;->a:I

    .line 32
    .line 33
    invoke-virtual {v2, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 34
    .line 35
    .line 36
    move-result v6

    .line 37
    iput v6, p0, Landroidx/constraintlayout/widget/k;->a:I

    .line 38
    .line 39
    :cond_0
    add-int/lit8 v5, v5, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 43
    .line 44
    .line 45
    :try_start_0
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    .line 46
    .line 47
    .line 48
    move-result v2
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    const/4 v3, 0x0

    .line 50
    :goto_1
    const/4 v5, 0x1

    .line 51
    if-eq v2, v5, :cond_8

    .line 52
    .line 53
    const-string v6, "StateSet"

    .line 54
    .line 55
    const/4 v7, 0x3

    .line 56
    const/4 v8, 0x2

    .line 57
    if-eq v2, v8, :cond_3

    .line 58
    .line 59
    if-eq v2, v7, :cond_2

    .line 60
    .line 61
    goto/16 :goto_4

    .line 62
    .line 63
    :cond_2
    :try_start_1
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-eqz v2, :cond_7

    .line 72
    .line 73
    goto/16 :goto_7

    .line 74
    .line 75
    :catch_0
    move-exception p0

    .line 76
    goto :goto_5

    .line 77
    :catch_1
    move-exception p0

    .line 78
    goto :goto_6

    .line 79
    :cond_3
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    .line 84
    .line 85
    .line 86
    move-result v9

    .line 87
    sparse-switch v9, :sswitch_data_0

    .line 88
    .line 89
    .line 90
    goto :goto_2

    .line 91
    :sswitch_0
    const-string v5, "Variant"

    .line 92
    .line 93
    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-eqz v2, :cond_4

    .line 98
    .line 99
    move v5, v7

    .line 100
    goto :goto_3

    .line 101
    :sswitch_1
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    if-eqz v2, :cond_4

    .line 106
    .line 107
    goto :goto_3

    .line 108
    :sswitch_2
    const-string v5, "LayoutDescription"

    .line 109
    .line 110
    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    if-eqz v2, :cond_4

    .line 115
    .line 116
    move v5, v4

    .line 117
    goto :goto_3

    .line 118
    :sswitch_3
    const-string v5, "State"

    .line 119
    .line 120
    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    if-eqz v2, :cond_4

    .line 125
    .line 126
    move v5, v8

    .line 127
    goto :goto_3

    .line 128
    :cond_4
    :goto_2
    const/4 v5, -0x1

    .line 129
    :goto_3
    if-eq v5, v8, :cond_6

    .line 130
    .line 131
    if-eq v5, v7, :cond_5

    .line 132
    .line 133
    goto :goto_4

    .line 134
    :cond_5
    new-instance v2, Landroidx/constraintlayout/widget/k$b;

    .line 135
    .line 136
    invoke-direct {v2, p1, p2}, Landroidx/constraintlayout/widget/k$b;-><init>(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V

    .line 137
    .line 138
    .line 139
    if-eqz v3, :cond_7

    .line 140
    .line 141
    invoke-virtual {v3, v2}, Landroidx/constraintlayout/widget/k$a;->a(Landroidx/constraintlayout/widget/k$b;)V

    .line 142
    .line 143
    .line 144
    goto :goto_4

    .line 145
    :cond_6
    new-instance v3, Landroidx/constraintlayout/widget/k$a;

    .line 146
    .line 147
    invoke-direct {v3, p1, p2}, Landroidx/constraintlayout/widget/k$a;-><init>(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V

    .line 148
    .line 149
    .line 150
    iget-object v2, p0, Landroidx/constraintlayout/widget/k;->d:Landroid/util/SparseArray;

    .line 151
    .line 152
    iget v5, v3, Landroidx/constraintlayout/widget/k$a;->a:I

    .line 153
    .line 154
    invoke-virtual {v2, v5, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 155
    .line 156
    .line 157
    :cond_7
    :goto_4
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 158
    .line 159
    .line 160
    move-result v2
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 161
    goto :goto_1

    .line 162
    :goto_5
    invoke-static {v1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 163
    .line 164
    .line 165
    goto :goto_7

    .line 166
    :goto_6
    invoke-static {v1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 167
    .line 168
    .line 169
    :cond_8
    :goto_7
    return-void

    .line 170
    nop

    .line 171
    :sswitch_data_0
    .sparse-switch
        0x4c7d471 -> :sswitch_3
        0x4d92b252 -> :sswitch_2
        0x526c4e31 -> :sswitch_1
        0x7155a865 -> :sswitch_0
    .end sparse-switch
.end method


# virtual methods
.method public a(IIFF)I
    .locals 3

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/widget/k;->d:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroidx/constraintlayout/widget/k$a;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    return p2

    .line 12
    :cond_0
    const/high16 p2, -0x40800000    # -1.0f

    .line 13
    .line 14
    cmpl-float v0, p3, p2

    .line 15
    .line 16
    if-eqz v0, :cond_6

    .line 17
    .line 18
    cmpl-float p2, p4, p2

    .line 19
    .line 20
    if-nez p2, :cond_1

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    iget-object p2, p0, Landroidx/constraintlayout/widget/k$a;->b:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    const/4 v0, 0x0

    .line 30
    :cond_2
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_4

    .line 35
    .line 36
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Landroidx/constraintlayout/widget/k$b;

    .line 41
    .line 42
    invoke-virtual {v1, p3, p4}, Landroidx/constraintlayout/widget/k$b;->a(FF)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_2

    .line 47
    .line 48
    iget v0, v1, Landroidx/constraintlayout/widget/k$b;->e:I

    .line 49
    .line 50
    if-ne p1, v0, :cond_3

    .line 51
    .line 52
    goto :goto_2

    .line 53
    :cond_3
    move-object v0, v1

    .line 54
    goto :goto_0

    .line 55
    :cond_4
    if-eqz v0, :cond_5

    .line 56
    .line 57
    iget p0, v0, Landroidx/constraintlayout/widget/k$b;->e:I

    .line 58
    .line 59
    return p0

    .line 60
    :cond_5
    iget p0, p0, Landroidx/constraintlayout/widget/k$a;->c:I

    .line 61
    .line 62
    return p0

    .line 63
    :cond_6
    :goto_1
    iget p2, p0, Landroidx/constraintlayout/widget/k$a;->c:I

    .line 64
    .line 65
    if-ne p2, p1, :cond_7

    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_7
    iget-object p2, p0, Landroidx/constraintlayout/widget/k$a;->b:Ljava/util/ArrayList;

    .line 69
    .line 70
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    :cond_8
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 75
    .line 76
    .line 77
    move-result p3

    .line 78
    if-eqz p3, :cond_9

    .line 79
    .line 80
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p3

    .line 84
    check-cast p3, Landroidx/constraintlayout/widget/k$b;

    .line 85
    .line 86
    iget p3, p3, Landroidx/constraintlayout/widget/k$b;->e:I

    .line 87
    .line 88
    if-ne p1, p3, :cond_8

    .line 89
    .line 90
    :goto_2
    return p1

    .line 91
    :cond_9
    iget p0, p0, Landroidx/constraintlayout/widget/k$a;->c:I

    .line 92
    .line 93
    return p0
.end method

.method public c(III)I
    .locals 1

    .line 1
    int-to-float p2, p2

    .line 2
    int-to-float p3, p3

    .line 3
    const/4 v0, -0x1

    .line 4
    invoke-virtual {p0, v0, p1, p2, p3}, Landroidx/constraintlayout/widget/k;->d(IIFF)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public d(IIFF)I
    .locals 2

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne p1, p2, :cond_5

    .line 3
    .line 4
    if-ne p2, v0, :cond_0

    .line 5
    .line 6
    iget-object p2, p0, Landroidx/constraintlayout/widget/k;->d:Landroid/util/SparseArray;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p2, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    check-cast p2, Landroidx/constraintlayout/widget/k$a;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p2, p0, Landroidx/constraintlayout/widget/k;->d:Landroid/util/SparseArray;

    .line 17
    .line 18
    iget v1, p0, Landroidx/constraintlayout/widget/k;->b:I

    .line 19
    .line 20
    invoke-virtual {p2, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    check-cast p2, Landroidx/constraintlayout/widget/k$a;

    .line 25
    .line 26
    :goto_0
    if-nez p2, :cond_1

    .line 27
    .line 28
    return v0

    .line 29
    :cond_1
    iget p0, p0, Landroidx/constraintlayout/widget/k;->c:I

    .line 30
    .line 31
    if-eq p0, v0, :cond_2

    .line 32
    .line 33
    iget-object p0, p2, Landroidx/constraintlayout/widget/k$a;->b:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Landroidx/constraintlayout/widget/k$b;

    .line 40
    .line 41
    invoke-virtual {p0, p3, p4}, Landroidx/constraintlayout/widget/k$b;->a(FF)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_2

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    invoke-virtual {p2, p3, p4}, Landroidx/constraintlayout/widget/k$a;->b(FF)I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-ne p1, p0, :cond_3

    .line 53
    .line 54
    :goto_1
    return p1

    .line 55
    :cond_3
    if-ne p0, v0, :cond_4

    .line 56
    .line 57
    iget p0, p2, Landroidx/constraintlayout/widget/k$a;->c:I

    .line 58
    .line 59
    return p0

    .line 60
    :cond_4
    iget-object p1, p2, Landroidx/constraintlayout/widget/k$a;->b:Ljava/util/ArrayList;

    .line 61
    .line 62
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    check-cast p0, Landroidx/constraintlayout/widget/k$b;

    .line 67
    .line 68
    iget p0, p0, Landroidx/constraintlayout/widget/k$b;->e:I

    .line 69
    .line 70
    return p0

    .line 71
    :cond_5
    iget-object p0, p0, Landroidx/constraintlayout/widget/k;->d:Landroid/util/SparseArray;

    .line 72
    .line 73
    invoke-virtual {p0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    check-cast p0, Landroidx/constraintlayout/widget/k$a;

    .line 78
    .line 79
    if-nez p0, :cond_6

    .line 80
    .line 81
    return v0

    .line 82
    :cond_6
    invoke-virtual {p0, p3, p4}, Landroidx/constraintlayout/widget/k$a;->b(FF)I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-ne p1, v0, :cond_7

    .line 87
    .line 88
    iget p0, p0, Landroidx/constraintlayout/widget/k$a;->c:I

    .line 89
    .line 90
    return p0

    .line 91
    :cond_7
    iget-object p0, p0, Landroidx/constraintlayout/widget/k$a;->b:Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    check-cast p0, Landroidx/constraintlayout/widget/k$b;

    .line 98
    .line 99
    iget p0, p0, Landroidx/constraintlayout/widget/k$b;->e:I

    .line 100
    .line 101
    return p0
.end method
