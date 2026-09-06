.class public LD0/i;
.super LD0/b;
.source "TextLayer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LD0/i$d;
    }
.end annotation


# instance fields
.field private final D:Ljava/lang/StringBuilder;

.field private final E:Landroid/graphics/RectF;

.field private final F:Landroid/graphics/Matrix;

.field private final G:Landroid/graphics/Paint;

.field private final H:Landroid/graphics/Paint;

.field private final I:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "LA0/d;",
            "Ljava/util/List<",
            "Lx0/d;",
            ">;>;"
        }
    .end annotation
.end field

.field private final J:Lo/j;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lo/j<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final K:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LD0/i$d;",
            ">;"
        }
    .end annotation
.end field

.field private final L:Ly0/o;

.field private final M:Lcom/airbnb/lottie/n;

.field private final N:Lv0/h;

.field private O:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private P:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private Q:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private R:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private S:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private T:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private U:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private V:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private W:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private X:Ly0/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly0/a<",
            "Landroid/graphics/Typeface;",
            "Landroid/graphics/Typeface;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/airbnb/lottie/n;LD0/e;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, LD0/b;-><init>(Lcom/airbnb/lottie/n;LD0/e;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, LD0/i;->D:Ljava/lang/StringBuilder;

    .line 11
    .line 12
    new-instance v0, Landroid/graphics/RectF;

    .line 13
    .line 14
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, LD0/i;->E:Landroid/graphics/RectF;

    .line 18
    .line 19
    new-instance v0, Landroid/graphics/Matrix;

    .line 20
    .line 21
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, LD0/i;->F:Landroid/graphics/Matrix;

    .line 25
    .line 26
    new-instance v0, LD0/i$a;

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-direct {v0, p0, v1}, LD0/i$a;-><init>(LD0/i;I)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, LD0/i;->G:Landroid/graphics/Paint;

    .line 33
    .line 34
    new-instance v0, LD0/i$b;

    .line 35
    .line 36
    invoke-direct {v0, p0, v1}, LD0/i$b;-><init>(LD0/i;I)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, LD0/i;->H:Landroid/graphics/Paint;

    .line 40
    .line 41
    new-instance v0, Ljava/util/HashMap;

    .line 42
    .line 43
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, LD0/i;->I:Ljava/util/Map;

    .line 47
    .line 48
    new-instance v0, Lo/j;

    .line 49
    .line 50
    invoke-direct {v0}, Lo/j;-><init>()V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, LD0/i;->J:Lo/j;

    .line 54
    .line 55
    new-instance v0, Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object v0, p0, LD0/i;->K:Ljava/util/List;

    .line 61
    .line 62
    iput-object p1, p0, LD0/i;->M:Lcom/airbnb/lottie/n;

    .line 63
    .line 64
    invoke-virtual {p2}, LD0/e;->b()Lv0/h;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iput-object p1, p0, LD0/i;->N:Lv0/h;

    .line 69
    .line 70
    invoke-virtual {p2}, LD0/e;->s()LB0/j;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p1}, LB0/j;->c()Ly0/o;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iput-object p1, p0, LD0/i;->L:Ly0/o;

    .line 79
    .line 80
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, p1}, LD0/b;->j(Ly0/a;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p2}, LD0/e;->t()LB0/k;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    if-eqz p1, :cond_0

    .line 91
    .line 92
    iget-object p2, p1, LB0/k;->a:LB0/a;

    .line 93
    .line 94
    if-eqz p2, :cond_0

    .line 95
    .line 96
    invoke-virtual {p2}, LB0/a;->a()Ly0/a;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    iput-object p2, p0, LD0/i;->O:Ly0/a;

    .line 101
    .line 102
    invoke-virtual {p2, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 103
    .line 104
    .line 105
    iget-object p2, p0, LD0/i;->O:Ly0/a;

    .line 106
    .line 107
    invoke-virtual {p0, p2}, LD0/b;->j(Ly0/a;)V

    .line 108
    .line 109
    .line 110
    :cond_0
    if-eqz p1, :cond_1

    .line 111
    .line 112
    iget-object p2, p1, LB0/k;->b:LB0/a;

    .line 113
    .line 114
    if-eqz p2, :cond_1

    .line 115
    .line 116
    invoke-virtual {p2}, LB0/a;->a()Ly0/a;

    .line 117
    .line 118
    .line 119
    move-result-object p2

    .line 120
    iput-object p2, p0, LD0/i;->Q:Ly0/a;

    .line 121
    .line 122
    invoke-virtual {p2, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 123
    .line 124
    .line 125
    iget-object p2, p0, LD0/i;->Q:Ly0/a;

    .line 126
    .line 127
    invoke-virtual {p0, p2}, LD0/b;->j(Ly0/a;)V

    .line 128
    .line 129
    .line 130
    :cond_1
    if-eqz p1, :cond_2

    .line 131
    .line 132
    iget-object p2, p1, LB0/k;->c:LB0/b;

    .line 133
    .line 134
    if-eqz p2, :cond_2

    .line 135
    .line 136
    invoke-virtual {p2}, LB0/b;->a()Ly0/a;

    .line 137
    .line 138
    .line 139
    move-result-object p2

    .line 140
    iput-object p2, p0, LD0/i;->S:Ly0/a;

    .line 141
    .line 142
    invoke-virtual {p2, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 143
    .line 144
    .line 145
    iget-object p2, p0, LD0/i;->S:Ly0/a;

    .line 146
    .line 147
    invoke-virtual {p0, p2}, LD0/b;->j(Ly0/a;)V

    .line 148
    .line 149
    .line 150
    :cond_2
    if-eqz p1, :cond_3

    .line 151
    .line 152
    iget-object p1, p1, LB0/k;->d:LB0/b;

    .line 153
    .line 154
    if-eqz p1, :cond_3

    .line 155
    .line 156
    invoke-virtual {p1}, LB0/b;->a()Ly0/a;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    iput-object p1, p0, LD0/i;->U:Ly0/a;

    .line 161
    .line 162
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, LD0/i;->U:Ly0/a;

    .line 166
    .line 167
    invoke-virtual {p0, p1}, LD0/b;->j(Ly0/a;)V

    .line 168
    .line 169
    .line 170
    :cond_3
    return-void
.end method

.method private O(Ljava/lang/String;I)Ljava/lang/String;
    .locals 5

    .line 1
    invoke-virtual {p1, p2}, Ljava/lang/String;->codePointAt(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    add-int/2addr v1, p2

    .line 10
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-ge v1, v2, :cond_1

    .line 15
    .line 16
    invoke-virtual {p1, v1}, Ljava/lang/String;->codePointAt(I)I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-direct {p0, v2}, LD0/i;->c0(I)Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-nez v3, :cond_0

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_0
    invoke-static {v2}, Ljava/lang/Character;->charCount(I)I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    add-int/2addr v1, v3

    .line 32
    mul-int/lit8 v0, v0, 0x1f

    .line 33
    .line 34
    add-int/2addr v0, v2

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    :goto_1
    iget-object v2, p0, LD0/i;->J:Lo/j;

    .line 37
    .line 38
    int-to-long v3, v0

    .line 39
    invoke-virtual {v2, v3, v4}, Lo/j;->c(J)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    iget-object p0, p0, LD0/i;->J:Lo/j;

    .line 46
    .line 47
    invoke-virtual {p0, v3, v4}, Lo/j;->d(J)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Ljava/lang/String;

    .line 52
    .line 53
    return-object p0

    .line 54
    :cond_2
    iget-object v0, p0, LD0/i;->D:Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const/4 v2, 0x0

    .line 57
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 58
    .line 59
    .line 60
    :goto_2
    if-ge p2, v1, :cond_3

    .line 61
    .line 62
    invoke-virtual {p1, p2}, Ljava/lang/String;->codePointAt(I)I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    iget-object v2, p0, LD0/i;->D:Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->appendCodePoint(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    add-int/2addr p2, v0

    .line 76
    goto :goto_2

    .line 77
    :cond_3
    iget-object p1, p0, LD0/i;->D:Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iget-object p0, p0, LD0/i;->J:Lo/j;

    .line 84
    .line 85
    invoke-virtual {p0, v3, v4, p1}, Lo/j;->i(JLjava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    return-object p1
.end method

.method private P(LA0/b;Landroid/graphics/Matrix;)V
    .locals 1

    .line 1
    iget-object p2, p0, LD0/i;->P:Ly0/a;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, LD0/i;->G:Landroid/graphics/Paint;

    .line 6
    .line 7
    invoke-virtual {p2}, Ly0/a;->h()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    check-cast p2, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object p2, p0, LD0/i;->O:Ly0/a;

    .line 22
    .line 23
    if-eqz p2, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, LD0/i;->G:Landroid/graphics/Paint;

    .line 26
    .line 27
    invoke-virtual {p2}, Ly0/a;->h()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    check-cast p2, Ljava/lang/Integer;

    .line 32
    .line 33
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    iget-object p2, p0, LD0/i;->G:Landroid/graphics/Paint;

    .line 42
    .line 43
    iget v0, p1, LA0/b;->h:I

    .line 44
    .line 45
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 46
    .line 47
    .line 48
    :goto_0
    iget-object p2, p0, LD0/i;->R:Ly0/a;

    .line 49
    .line 50
    if-eqz p2, :cond_2

    .line 51
    .line 52
    iget-object v0, p0, LD0/i;->H:Landroid/graphics/Paint;

    .line 53
    .line 54
    invoke-virtual {p2}, Ly0/a;->h()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    check-cast p2, Ljava/lang/Integer;

    .line 59
    .line 60
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    iget-object p2, p0, LD0/i;->Q:Ly0/a;

    .line 69
    .line 70
    if-eqz p2, :cond_3

    .line 71
    .line 72
    iget-object v0, p0, LD0/i;->H:Landroid/graphics/Paint;

    .line 73
    .line 74
    invoke-virtual {p2}, Ly0/a;->h()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    check-cast p2, Ljava/lang/Integer;

    .line 79
    .line 80
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 81
    .line 82
    .line 83
    move-result p2

    .line 84
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_3
    iget-object p2, p0, LD0/i;->H:Landroid/graphics/Paint;

    .line 89
    .line 90
    iget v0, p1, LA0/b;->i:I

    .line 91
    .line 92
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 93
    .line 94
    .line 95
    :goto_1
    iget-object p2, p0, LD0/b;->x:Ly0/p;

    .line 96
    .line 97
    invoke-virtual {p2}, Ly0/p;->h()Ly0/a;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    const/16 v0, 0x64

    .line 102
    .line 103
    if-nez p2, :cond_4

    .line 104
    .line 105
    move p2, v0

    .line 106
    goto :goto_2

    .line 107
    :cond_4
    iget-object p2, p0, LD0/b;->x:Ly0/p;

    .line 108
    .line 109
    invoke-virtual {p2}, Ly0/p;->h()Ly0/a;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    invoke-virtual {p2}, Ly0/a;->h()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    check-cast p2, Ljava/lang/Integer;

    .line 118
    .line 119
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 120
    .line 121
    .line 122
    move-result p2

    .line 123
    :goto_2
    mul-int/lit16 p2, p2, 0xff

    .line 124
    .line 125
    div-int/2addr p2, v0

    .line 126
    iget-object v0, p0, LD0/i;->G:Landroid/graphics/Paint;

    .line 127
    .line 128
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, LD0/i;->H:Landroid/graphics/Paint;

    .line 132
    .line 133
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 134
    .line 135
    .line 136
    iget-object p2, p0, LD0/i;->T:Ly0/a;

    .line 137
    .line 138
    if-eqz p2, :cond_5

    .line 139
    .line 140
    iget-object p0, p0, LD0/i;->H:Landroid/graphics/Paint;

    .line 141
    .line 142
    invoke-virtual {p2}, Ly0/a;->h()Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    check-cast p1, Ljava/lang/Float;

    .line 147
    .line 148
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 153
    .line 154
    .line 155
    return-void

    .line 156
    :cond_5
    iget-object p2, p0, LD0/i;->S:Ly0/a;

    .line 157
    .line 158
    if-eqz p2, :cond_6

    .line 159
    .line 160
    iget-object p0, p0, LD0/i;->H:Landroid/graphics/Paint;

    .line 161
    .line 162
    invoke-virtual {p2}, Ly0/a;->h()Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    check-cast p1, Ljava/lang/Float;

    .line 167
    .line 168
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 173
    .line 174
    .line 175
    return-void

    .line 176
    :cond_6
    iget-object p0, p0, LD0/i;->H:Landroid/graphics/Paint;

    .line 177
    .line 178
    iget p1, p1, LA0/b;->j:F

    .line 179
    .line 180
    invoke-static {}, LH0/h;->e()F

    .line 181
    .line 182
    .line 183
    move-result p2

    .line 184
    mul-float/2addr p1, p2

    .line 185
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 186
    .line 187
    .line 188
    return-void
.end method

.method private Q(Ljava/lang/String;Landroid/graphics/Paint;Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    invoke-virtual {p2}, Landroid/graphics/Paint;->getColor()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p2}, Landroid/graphics/Paint;->getStyle()Landroid/graphics/Paint$Style;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 13
    .line 14
    if-ne p0, v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p2}, Landroid/graphics/Paint;->getStrokeWidth()F

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    const/4 v0, 0x0

    .line 21
    cmpl-float p0, p0, v0

    .line 22
    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    :goto_0
    return-void

    .line 26
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    const/4 v4, 0x0

    .line 31
    const/4 v5, 0x0

    .line 32
    const/4 v2, 0x0

    .line 33
    move-object v1, p1

    .line 34
    move-object v6, p2

    .line 35
    move-object v0, p3

    .line 36
    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;IIFFLandroid/graphics/Paint;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private R(LA0/d;FLA0/b;Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    invoke-direct {p0, p1}, LD0/i;->Z(LA0/d;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    move v1, v0

    .line 7
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-ge v1, v2, :cond_1

    .line 12
    .line 13
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lx0/d;

    .line 18
    .line 19
    invoke-virtual {v2}, Lx0/d;->c()Landroid/graphics/Path;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iget-object v3, p0, LD0/i;->E:Landroid/graphics/RectF;

    .line 24
    .line 25
    invoke-virtual {v2, v3, v0}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v3, p0, LD0/i;->F:Landroid/graphics/Matrix;

    .line 29
    .line 30
    invoke-virtual {v3}, Landroid/graphics/Matrix;->reset()V

    .line 31
    .line 32
    .line 33
    iget-object v3, p0, LD0/i;->F:Landroid/graphics/Matrix;

    .line 34
    .line 35
    iget v4, p3, LA0/b;->g:F

    .line 36
    .line 37
    neg-float v4, v4

    .line 38
    invoke-static {}, LH0/h;->e()F

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    mul-float/2addr v4, v5

    .line 43
    const/4 v5, 0x0

    .line 44
    invoke-virtual {v3, v5, v4}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 45
    .line 46
    .line 47
    iget-object v3, p0, LD0/i;->F:Landroid/graphics/Matrix;

    .line 48
    .line 49
    invoke-virtual {v3, p2, p2}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 50
    .line 51
    .line 52
    iget-object v3, p0, LD0/i;->F:Landroid/graphics/Matrix;

    .line 53
    .line 54
    invoke-virtual {v2, v3}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 55
    .line 56
    .line 57
    iget-boolean v3, p3, LA0/b;->k:Z

    .line 58
    .line 59
    if-eqz v3, :cond_0

    .line 60
    .line 61
    iget-object v3, p0, LD0/i;->G:Landroid/graphics/Paint;

    .line 62
    .line 63
    invoke-direct {p0, v2, v3, p4}, LD0/i;->U(Landroid/graphics/Path;Landroid/graphics/Paint;Landroid/graphics/Canvas;)V

    .line 64
    .line 65
    .line 66
    iget-object v3, p0, LD0/i;->H:Landroid/graphics/Paint;

    .line 67
    .line 68
    invoke-direct {p0, v2, v3, p4}, LD0/i;->U(Landroid/graphics/Path;Landroid/graphics/Paint;Landroid/graphics/Canvas;)V

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_0
    iget-object v3, p0, LD0/i;->H:Landroid/graphics/Paint;

    .line 73
    .line 74
    invoke-direct {p0, v2, v3, p4}, LD0/i;->U(Landroid/graphics/Path;Landroid/graphics/Paint;Landroid/graphics/Canvas;)V

    .line 75
    .line 76
    .line 77
    iget-object v3, p0, LD0/i;->G:Landroid/graphics/Paint;

    .line 78
    .line 79
    invoke-direct {p0, v2, v3, p4}, LD0/i;->U(Landroid/graphics/Path;Landroid/graphics/Paint;Landroid/graphics/Canvas;)V

    .line 80
    .line 81
    .line 82
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    return-void
.end method

.method private S(Ljava/lang/String;LA0/b;Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    iget-boolean p2, p2, LA0/b;->k:Z

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object p2, p0, LD0/i;->G:Landroid/graphics/Paint;

    .line 6
    .line 7
    invoke-direct {p0, p1, p2, p3}, LD0/i;->Q(Ljava/lang/String;Landroid/graphics/Paint;Landroid/graphics/Canvas;)V

    .line 8
    .line 9
    .line 10
    iget-object p2, p0, LD0/i;->H:Landroid/graphics/Paint;

    .line 11
    .line 12
    invoke-direct {p0, p1, p2, p3}, LD0/i;->Q(Ljava/lang/String;Landroid/graphics/Paint;Landroid/graphics/Canvas;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p2, p0, LD0/i;->H:Landroid/graphics/Paint;

    .line 17
    .line 18
    invoke-direct {p0, p1, p2, p3}, LD0/i;->Q(Ljava/lang/String;Landroid/graphics/Paint;Landroid/graphics/Canvas;)V

    .line 19
    .line 20
    .line 21
    iget-object p2, p0, LD0/i;->G:Landroid/graphics/Paint;

    .line 22
    .line 23
    invoke-direct {p0, p1, p2, p3}, LD0/i;->Q(Ljava/lang/String;Landroid/graphics/Paint;Landroid/graphics/Canvas;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private T(Ljava/lang/String;LA0/b;Landroid/graphics/Canvas;F)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-ge v0, v1, :cond_0

    .line 7
    .line 8
    invoke-direct {p0, p1, v0}, LD0/i;->O(Ljava/lang/String;I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    add-int/2addr v0, v2

    .line 17
    invoke-direct {p0, v1, p2, p3}, LD0/i;->S(Ljava/lang/String;LA0/b;Landroid/graphics/Canvas;)V

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, LD0/i;->G:Landroid/graphics/Paint;

    .line 21
    .line 22
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    add-float/2addr v1, p4

    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {p3, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void
.end method

.method private U(Landroid/graphics/Path;Landroid/graphics/Paint;Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/graphics/Paint;->getColor()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p2}, Landroid/graphics/Paint;->getStyle()Landroid/graphics/Paint$Style;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 13
    .line 14
    if-ne p0, v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p2}, Landroid/graphics/Paint;->getStrokeWidth()F

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    const/4 v0, 0x0

    .line 21
    cmpl-float p0, p0, v0

    .line 22
    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    :goto_0
    return-void

    .line 26
    :cond_1
    invoke-virtual {p3, p1, p2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private V(Ljava/lang/String;LA0/b;LA0/c;Landroid/graphics/Canvas;FFF)V
    .locals 3

    .line 1
    const/4 p5, 0x0

    .line 2
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-ge p5, v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p1, p5}, Ljava/lang/String;->charAt(I)C

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p3}, LA0/c;->a()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {p3}, LA0/c;->c()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-static {v0, v1, v2}, LA0/d;->c(CLjava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p0, LD0/i;->N:Lv0/h;

    .line 25
    .line 26
    invoke-virtual {v1}, Lv0/h;->c()Lo/s;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1, v0}, Lo/s;->d(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, LA0/d;

    .line 35
    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_0
    invoke-direct {p0, v0, p6, p2, p4}, LD0/i;->R(LA0/d;FLA0/b;Landroid/graphics/Canvas;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, LA0/d;->b()D

    .line 43
    .line 44
    .line 45
    move-result-wide v0

    .line 46
    double-to-float v0, v0

    .line 47
    mul-float/2addr v0, p6

    .line 48
    invoke-static {}, LH0/h;->e()F

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    mul-float/2addr v0, v1

    .line 53
    add-float/2addr v0, p7

    .line 54
    const/4 v1, 0x0

    .line 55
    invoke-virtual {p4, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 56
    .line 57
    .line 58
    :goto_1
    add-int/lit8 p5, p5, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    return-void
.end method

.method private W(LA0/b;LA0/c;Landroid/graphics/Canvas;)V
    .locals 12

    .line 1
    invoke-direct {p0, p2}, LD0/i;->b0(LA0/c;)Landroid/graphics/Typeface;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_7

    .line 8
    .line 9
    :cond_0
    iget-object v1, p1, LA0/b;->a:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v2, p0, LD0/i;->M:Lcom/airbnb/lottie/n;

    .line 12
    .line 13
    invoke-virtual {v2}, Lcom/airbnb/lottie/n;->W()Lv0/D;

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, LD0/i;->G:Landroid/graphics/Paint;

    .line 17
    .line 18
    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, LD0/i;->W:Ly0/a;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {v0}, Ly0/a;->h()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ljava/lang/Float;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    iget v0, p1, LA0/b;->c:F

    .line 37
    .line 38
    :goto_0
    iget-object v2, p0, LD0/i;->G:Landroid/graphics/Paint;

    .line 39
    .line 40
    invoke-static {}, LH0/h;->e()F

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    mul-float/2addr v3, v0

    .line 45
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, LD0/i;->H:Landroid/graphics/Paint;

    .line 49
    .line 50
    iget-object v3, p0, LD0/i;->G:Landroid/graphics/Paint;

    .line 51
    .line 52
    invoke-virtual {v3}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 57
    .line 58
    .line 59
    iget-object v2, p0, LD0/i;->H:Landroid/graphics/Paint;

    .line 60
    .line 61
    iget-object v3, p0, LD0/i;->G:Landroid/graphics/Paint;

    .line 62
    .line 63
    invoke-virtual {v3}, Landroid/graphics/Paint;->getTextSize()F

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 68
    .line 69
    .line 70
    iget v2, p1, LA0/b;->e:I

    .line 71
    .line 72
    int-to-float v2, v2

    .line 73
    const/high16 v3, 0x41200000    # 10.0f

    .line 74
    .line 75
    div-float/2addr v2, v3

    .line 76
    iget-object v3, p0, LD0/i;->V:Ly0/a;

    .line 77
    .line 78
    if-eqz v3, :cond_2

    .line 79
    .line 80
    invoke-virtual {v3}, Ly0/a;->h()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    check-cast v3, Ljava/lang/Float;

    .line 85
    .line 86
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    :goto_1
    add-float/2addr v2, v3

    .line 91
    goto :goto_2

    .line 92
    :cond_2
    iget-object v3, p0, LD0/i;->U:Ly0/a;

    .line 93
    .line 94
    if-eqz v3, :cond_3

    .line 95
    .line 96
    invoke-virtual {v3}, Ly0/a;->h()Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    check-cast v3, Ljava/lang/Float;

    .line 101
    .line 102
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    goto :goto_1

    .line 107
    :cond_3
    :goto_2
    invoke-static {}, LH0/h;->e()F

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    mul-float/2addr v2, v3

    .line 112
    mul-float/2addr v2, v0

    .line 113
    const/high16 v0, 0x42c80000    # 100.0f

    .line 114
    .line 115
    div-float v8, v2, v0

    .line 116
    .line 117
    invoke-direct {p0, v1}, LD0/i;->a0(Ljava/lang/String;)Ljava/util/List;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    const/4 v2, 0x0

    .line 126
    const/4 v3, -0x1

    .line 127
    move v11, v2

    .line 128
    move v10, v3

    .line 129
    :goto_3
    if-ge v11, v1, :cond_6

    .line 130
    .line 131
    invoke-interface {v0, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    move-object v4, v3

    .line 136
    check-cast v4, Ljava/lang/String;

    .line 137
    .line 138
    iget-object v3, p1, LA0/b;->m:Landroid/graphics/PointF;

    .line 139
    .line 140
    if-nez v3, :cond_4

    .line 141
    .line 142
    const/4 v3, 0x0

    .line 143
    :goto_4
    move v5, v3

    .line 144
    goto :goto_5

    .line 145
    :cond_4
    iget v3, v3, Landroid/graphics/PointF;->x:F

    .line 146
    .line 147
    goto :goto_4

    .line 148
    :goto_5
    const/4 v7, 0x0

    .line 149
    const/4 v9, 0x0

    .line 150
    move-object v3, p0

    .line 151
    move-object v6, p2

    .line 152
    invoke-direct/range {v3 .. v9}, LD0/i;->e0(Ljava/lang/String;FLA0/c;FFZ)Ljava/util/List;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    move p2, v2

    .line 157
    :goto_6
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 158
    .line 159
    .line 160
    move-result v4

    .line 161
    if-ge p2, v4, :cond_5

    .line 162
    .line 163
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v4

    .line 167
    check-cast v4, LD0/i$d;

    .line 168
    .line 169
    add-int/lit8 v10, v10, 0x1

    .line 170
    .line 171
    invoke-virtual {p3}, Landroid/graphics/Canvas;->save()I

    .line 172
    .line 173
    .line 174
    invoke-static {v4}, LD0/i$d;->a(LD0/i$d;)F

    .line 175
    .line 176
    .line 177
    move-result v5

    .line 178
    invoke-direct {v3, p3, p1, v10, v5}, LD0/i;->d0(Landroid/graphics/Canvas;LA0/b;IF)V

    .line 179
    .line 180
    .line 181
    invoke-static {v4}, LD0/i$d;->b(LD0/i$d;)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v4

    .line 185
    invoke-direct {v3, v4, p1, p3, v8}, LD0/i;->T(Ljava/lang/String;LA0/b;Landroid/graphics/Canvas;F)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p3}, Landroid/graphics/Canvas;->restore()V

    .line 189
    .line 190
    .line 191
    add-int/lit8 p2, p2, 0x1

    .line 192
    .line 193
    goto :goto_6

    .line 194
    :cond_5
    add-int/lit8 v11, v11, 0x1

    .line 195
    .line 196
    move-object p0, v3

    .line 197
    move-object p2, v6

    .line 198
    goto :goto_3

    .line 199
    :cond_6
    :goto_7
    return-void
.end method

.method private X(LA0/b;Landroid/graphics/Matrix;LA0/c;Landroid/graphics/Canvas;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v7, p1

    .line 4
    .line 5
    iget-object v1, v0, LD0/i;->W:Ly0/a;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1}, Ly0/a;->h()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Ljava/lang/Float;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget v1, v7, LA0/b;->c:F

    .line 21
    .line 22
    :goto_0
    const/high16 v2, 0x42c80000    # 100.0f

    .line 23
    .line 24
    div-float v4, v1, v2

    .line 25
    .line 26
    invoke-static/range {p2 .. p2}, LH0/h;->g(Landroid/graphics/Matrix;)F

    .line 27
    .line 28
    .line 29
    move-result v8

    .line 30
    iget-object v1, v7, LA0/b;->a:Ljava/lang/String;

    .line 31
    .line 32
    invoke-direct {v0, v1}, LD0/i;->a0(Ljava/lang/String;)Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object v9

    .line 36
    invoke-interface {v9}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result v10

    .line 40
    iget v1, v7, LA0/b;->e:I

    .line 41
    .line 42
    int-to-float v1, v1

    .line 43
    const/high16 v2, 0x41200000    # 10.0f

    .line 44
    .line 45
    div-float/2addr v1, v2

    .line 46
    iget-object v2, v0, LD0/i;->V:Ly0/a;

    .line 47
    .line 48
    if-eqz v2, :cond_2

    .line 49
    .line 50
    invoke-virtual {v2}, Ly0/a;->h()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    check-cast v2, Ljava/lang/Float;

    .line 55
    .line 56
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    :goto_1
    add-float/2addr v1, v2

    .line 61
    :cond_1
    move v5, v1

    .line 62
    goto :goto_2

    .line 63
    :cond_2
    iget-object v2, v0, LD0/i;->U:Ly0/a;

    .line 64
    .line 65
    if-eqz v2, :cond_1

    .line 66
    .line 67
    invoke-virtual {v2}, Ly0/a;->h()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    check-cast v2, Ljava/lang/Float;

    .line 72
    .line 73
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    goto :goto_1

    .line 78
    :goto_2
    const/4 v11, 0x0

    .line 79
    const/4 v1, -0x1

    .line 80
    move v12, v1

    .line 81
    move v13, v11

    .line 82
    :goto_3
    if-ge v13, v10, :cond_5

    .line 83
    .line 84
    invoke-interface {v9, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    check-cast v1, Ljava/lang/String;

    .line 89
    .line 90
    iget-object v2, v7, LA0/b;->m:Landroid/graphics/PointF;

    .line 91
    .line 92
    if-nez v2, :cond_3

    .line 93
    .line 94
    const/4 v2, 0x0

    .line 95
    goto :goto_4

    .line 96
    :cond_3
    iget v2, v2, Landroid/graphics/PointF;->x:F

    .line 97
    .line 98
    :goto_4
    const/4 v6, 0x1

    .line 99
    move-object/from16 v3, p3

    .line 100
    .line 101
    invoke-direct/range {v0 .. v6}, LD0/i;->e0(Ljava/lang/String;FLA0/c;FFZ)Ljava/util/List;

    .line 102
    .line 103
    .line 104
    move-result-object v14

    .line 105
    move v15, v11

    .line 106
    :goto_5
    invoke-interface {v14}, Ljava/util/List;->size()I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-ge v15, v1, :cond_4

    .line 111
    .line 112
    invoke-interface {v14, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    check-cast v1, LD0/i$d;

    .line 117
    .line 118
    add-int/lit8 v12, v12, 0x1

    .line 119
    .line 120
    invoke-virtual/range {p4 .. p4}, Landroid/graphics/Canvas;->save()I

    .line 121
    .line 122
    .line 123
    invoke-static {v1}, LD0/i$d;->a(LD0/i$d;)F

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    move-object/from16 v3, p4

    .line 128
    .line 129
    invoke-direct {v0, v3, v7, v12, v2}, LD0/i;->d0(Landroid/graphics/Canvas;LA0/b;IF)V

    .line 130
    .line 131
    .line 132
    invoke-static {v1}, LD0/i$d;->b(LD0/i$d;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    move v6, v4

    .line 137
    move-object v2, v7

    .line 138
    move-object v4, v3

    .line 139
    move v7, v5

    .line 140
    move v5, v8

    .line 141
    move-object/from16 v3, p3

    .line 142
    .line 143
    invoke-direct/range {v0 .. v7}, LD0/i;->V(Ljava/lang/String;LA0/b;LA0/c;Landroid/graphics/Canvas;FFF)V

    .line 144
    .line 145
    .line 146
    move v4, v6

    .line 147
    invoke-virtual/range {p4 .. p4}, Landroid/graphics/Canvas;->restore()V

    .line 148
    .line 149
    .line 150
    add-int/lit8 v15, v15, 0x1

    .line 151
    .line 152
    move-object/from16 v0, p0

    .line 153
    .line 154
    move v5, v7

    .line 155
    move-object/from16 v7, p1

    .line 156
    .line 157
    goto :goto_5

    .line 158
    :cond_4
    move v7, v5

    .line 159
    move v5, v8

    .line 160
    add-int/lit8 v13, v13, 0x1

    .line 161
    .line 162
    move-object/from16 v0, p0

    .line 163
    .line 164
    move v5, v7

    .line 165
    move-object/from16 v7, p1

    .line 166
    .line 167
    goto :goto_3

    .line 168
    :cond_5
    return-void
.end method

.method private Y(I)LD0/i$d;
    .locals 4

    .line 1
    iget-object v0, p0, LD0/i;->K:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    :goto_0
    if-ge v0, p1, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, LD0/i;->K:Ljava/util/List;

    .line 10
    .line 11
    new-instance v2, LD0/i$d;

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-direct {v2, v3}, LD0/i$d;-><init>(LD0/i$a;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    add-int/lit8 v0, v0, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object p0, p0, LD0/i;->K:Ljava/util/List;

    .line 24
    .line 25
    add-int/lit8 p1, p1, -0x1

    .line 26
    .line 27
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, LD0/i$d;

    .line 32
    .line 33
    return-object p0
.end method

.method private Z(LA0/d;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LA0/d;",
            ")",
            "Ljava/util/List<",
            "Lx0/d;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LD0/i;->I:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, LD0/i;->I:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/util/List;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-virtual {p1}, LA0/d;->a()Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    new-instance v2, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 29
    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    :goto_0
    if-ge v3, v1, :cond_1

    .line 33
    .line 34
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    check-cast v4, LC0/p;

    .line 39
    .line 40
    new-instance v5, Lx0/d;

    .line 41
    .line 42
    iget-object v6, p0, LD0/i;->M:Lcom/airbnb/lottie/n;

    .line 43
    .line 44
    iget-object v7, p0, LD0/i;->N:Lv0/h;

    .line 45
    .line 46
    invoke-direct {v5, v6, p0, v4, v7}, Lx0/d;-><init>(Lcom/airbnb/lottie/n;LD0/b;LC0/p;Lv0/h;)V

    .line 47
    .line 48
    .line 49
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    add-int/lit8 v3, v3, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    iget-object p0, p0, LD0/i;->I:Ljava/util/Map;

    .line 56
    .line 57
    invoke-interface {p0, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    return-object v2
.end method

.method private a0(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const-string p0, "\r\n"

    .line 2
    .line 3
    const-string v0, "\r"

    .line 4
    .line 5
    invoke-virtual {p1, p0, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string p1, "\u0003"

    .line 10
    .line 11
    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string p1, "\n"

    .line 16
    .line 17
    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method private b0(LA0/c;)Landroid/graphics/Typeface;
    .locals 1

    .line 1
    iget-object v0, p0, LD0/i;->X:Ly0/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ly0/a;->h()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/graphics/Typeface;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_0
    iget-object p0, p0, LD0/i;->M:Lcom/airbnb/lottie/n;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/airbnb/lottie/n;->X(LA0/c;)Landroid/graphics/Typeface;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    invoke-virtual {p1}, LA0/c;->d()Landroid/graphics/Typeface;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method private c0(I)Z
    .locals 1

    .line 1
    invoke-static {p1}, Ljava/lang/Character;->getType(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 v0, 0x10

    .line 6
    .line 7
    if-eq p0, v0, :cond_1

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Character;->getType(I)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/16 v0, 0x1b

    .line 14
    .line 15
    if-eq p0, v0, :cond_1

    .line 16
    .line 17
    invoke-static {p1}, Ljava/lang/Character;->getType(I)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    const/4 v0, 0x6

    .line 22
    if-eq p0, v0, :cond_1

    .line 23
    .line 24
    invoke-static {p1}, Ljava/lang/Character;->getType(I)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    const/16 v0, 0x1c

    .line 29
    .line 30
    if-eq p0, v0, :cond_1

    .line 31
    .line 32
    invoke-static {p1}, Ljava/lang/Character;->getType(I)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    const/16 v0, 0x8

    .line 37
    .line 38
    if-eq p0, v0, :cond_1

    .line 39
    .line 40
    invoke-static {p1}, Ljava/lang/Character;->getType(I)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    const/16 p1, 0x13

    .line 45
    .line 46
    if-ne p0, p1, :cond_0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const/4 p0, 0x0

    .line 50
    return p0

    .line 51
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 52
    return p0
.end method

.method private d0(Landroid/graphics/Canvas;LA0/b;IF)V
    .locals 5

    .line 1
    iget-object p0, p2, LA0/b;->l:Landroid/graphics/PointF;

    .line 2
    .line 3
    iget-object v0, p2, LA0/b;->m:Landroid/graphics/PointF;

    .line 4
    .line 5
    invoke-static {}, LH0/h;->e()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    move v3, v2

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget v3, p2, LA0/b;->f:F

    .line 15
    .line 16
    mul-float/2addr v3, v1

    .line 17
    iget v4, p0, Landroid/graphics/PointF;->y:F

    .line 18
    .line 19
    add-float/2addr v3, v4

    .line 20
    :goto_0
    int-to-float p3, p3

    .line 21
    iget v4, p2, LA0/b;->f:F

    .line 22
    .line 23
    mul-float/2addr p3, v4

    .line 24
    mul-float/2addr p3, v1

    .line 25
    add-float/2addr p3, v3

    .line 26
    if-nez p0, :cond_1

    .line 27
    .line 28
    move p0, v2

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    iget p0, p0, Landroid/graphics/PointF;->x:F

    .line 31
    .line 32
    :goto_1
    if-nez v0, :cond_2

    .line 33
    .line 34
    goto :goto_2

    .line 35
    :cond_2
    iget v2, v0, Landroid/graphics/PointF;->x:F

    .line 36
    .line 37
    :goto_2
    sget-object v0, LD0/i$c;->a:[I

    .line 38
    .line 39
    iget-object p2, p2, LA0/b;->d:LA0/b$a;

    .line 40
    .line 41
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    aget p2, v0, p2

    .line 46
    .line 47
    const/4 v0, 0x1

    .line 48
    if-eq p2, v0, :cond_5

    .line 49
    .line 50
    const/4 v0, 0x2

    .line 51
    if-eq p2, v0, :cond_4

    .line 52
    .line 53
    const/4 v0, 0x3

    .line 54
    if-eq p2, v0, :cond_3

    .line 55
    .line 56
    return-void

    .line 57
    :cond_3
    const/high16 p2, 0x40000000    # 2.0f

    .line 58
    .line 59
    div-float/2addr v2, p2

    .line 60
    add-float/2addr p0, v2

    .line 61
    div-float/2addr p4, p2

    .line 62
    sub-float/2addr p0, p4

    .line 63
    invoke-virtual {p1, p0, p3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_4
    add-float/2addr p0, v2

    .line 68
    sub-float/2addr p0, p4

    .line 69
    invoke-virtual {p1, p0, p3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_5
    invoke-virtual {p1, p0, p3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method private e0(Ljava/lang/String;FLA0/c;FFZ)Ljava/util/List;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "F",
            "LA0/c;",
            "FFZ)",
            "Ljava/util/List<",
            "LD0/i$d;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x0

    .line 7
    move v4, v2

    .line 8
    move v6, v4

    .line 9
    move v7, v6

    .line 10
    move v8, v7

    .line 11
    move v10, v8

    .line 12
    move v5, v3

    .line 13
    move v9, v5

    .line 14
    move v11, v9

    .line 15
    :goto_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 16
    .line 17
    .line 18
    move-result v12

    .line 19
    if-ge v4, v12, :cond_7

    .line 20
    .line 21
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    .line 22
    .line 23
    .line 24
    move-result v12

    .line 25
    if-eqz p6, :cond_1

    .line 26
    .line 27
    invoke-virtual/range {p3 .. p3}, LA0/c;->a()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v13

    .line 31
    invoke-virtual/range {p3 .. p3}, LA0/c;->c()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v14

    .line 35
    invoke-static {v12, v13, v14}, LA0/d;->c(CLjava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v13

    .line 39
    iget-object v14, v0, LD0/i;->N:Lv0/h;

    .line 40
    .line 41
    invoke-virtual {v14}, Lv0/h;->c()Lo/s;

    .line 42
    .line 43
    .line 44
    move-result-object v14

    .line 45
    invoke-virtual {v14, v13}, Lo/s;->d(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v13

    .line 49
    check-cast v13, LA0/d;

    .line 50
    .line 51
    if-nez v13, :cond_0

    .line 52
    .line 53
    goto/16 :goto_4

    .line 54
    .line 55
    :cond_0
    invoke-virtual {v13}, LA0/d;->b()D

    .line 56
    .line 57
    .line 58
    move-result-wide v13

    .line 59
    double-to-float v13, v13

    .line 60
    mul-float v13, v13, p4

    .line 61
    .line 62
    invoke-static {}, LH0/h;->e()F

    .line 63
    .line 64
    .line 65
    move-result v14

    .line 66
    mul-float/2addr v13, v14

    .line 67
    :goto_1
    add-float v13, v13, p5

    .line 68
    .line 69
    goto :goto_2

    .line 70
    :cond_1
    iget-object v13, v0, LD0/i;->G:Landroid/graphics/Paint;

    .line 71
    .line 72
    add-int/lit8 v14, v4, 0x1

    .line 73
    .line 74
    invoke-virtual {v1, v4, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v14

    .line 78
    invoke-virtual {v13, v14}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 79
    .line 80
    .line 81
    move-result v13

    .line 82
    goto :goto_1

    .line 83
    :goto_2
    const/16 v14, 0x20

    .line 84
    .line 85
    if-ne v12, v14, :cond_2

    .line 86
    .line 87
    const/4 v8, 0x1

    .line 88
    move v11, v13

    .line 89
    goto :goto_3

    .line 90
    :cond_2
    if-eqz v8, :cond_3

    .line 91
    .line 92
    move v8, v2

    .line 93
    move v10, v4

    .line 94
    move v9, v13

    .line 95
    goto :goto_3

    .line 96
    :cond_3
    add-float/2addr v9, v13

    .line 97
    :goto_3
    add-float/2addr v5, v13

    .line 98
    cmpl-float v15, p2, v3

    .line 99
    .line 100
    if-lez v15, :cond_6

    .line 101
    .line 102
    cmpl-float v15, v5, p2

    .line 103
    .line 104
    if-ltz v15, :cond_6

    .line 105
    .line 106
    if-ne v12, v14, :cond_4

    .line 107
    .line 108
    goto :goto_4

    .line 109
    :cond_4
    add-int/lit8 v6, v6, 0x1

    .line 110
    .line 111
    invoke-direct {v0, v6}, LD0/i;->Y(I)LD0/i$d;

    .line 112
    .line 113
    .line 114
    move-result-object v12

    .line 115
    if-ne v10, v7, :cond_5

    .line 116
    .line 117
    invoke-virtual {v1, v7, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v7

    .line 121
    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v9

    .line 125
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    .line 126
    .line 127
    .line 128
    move-result v10

    .line 129
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 130
    .line 131
    .line 132
    move-result v7

    .line 133
    sub-int/2addr v10, v7

    .line 134
    int-to-float v7, v10

    .line 135
    mul-float/2addr v7, v11

    .line 136
    sub-float/2addr v5, v13

    .line 137
    sub-float/2addr v5, v7

    .line 138
    invoke-virtual {v12, v9, v5}, LD0/i$d;->c(Ljava/lang/String;F)V

    .line 139
    .line 140
    .line 141
    move v7, v4

    .line 142
    move v10, v7

    .line 143
    move v5, v13

    .line 144
    move v9, v5

    .line 145
    goto :goto_4

    .line 146
    :cond_5
    add-int/lit8 v13, v10, -0x1

    .line 147
    .line 148
    invoke-virtual {v1, v7, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v7

    .line 152
    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v13

    .line 156
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 157
    .line 158
    .line 159
    move-result v7

    .line 160
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    .line 161
    .line 162
    .line 163
    move-result v14

    .line 164
    sub-int/2addr v7, v14

    .line 165
    int-to-float v7, v7

    .line 166
    mul-float/2addr v7, v11

    .line 167
    sub-float/2addr v5, v9

    .line 168
    sub-float/2addr v5, v7

    .line 169
    sub-float/2addr v5, v11

    .line 170
    invoke-virtual {v12, v13, v5}, LD0/i$d;->c(Ljava/lang/String;F)V

    .line 171
    .line 172
    .line 173
    move v5, v9

    .line 174
    move v7, v10

    .line 175
    :cond_6
    :goto_4
    add-int/lit8 v4, v4, 0x1

    .line 176
    .line 177
    goto/16 :goto_0

    .line 178
    .line 179
    :cond_7
    cmpl-float v3, v5, v3

    .line 180
    .line 181
    if-lez v3, :cond_8

    .line 182
    .line 183
    add-int/lit8 v6, v6, 0x1

    .line 184
    .line 185
    invoke-direct {v0, v6}, LD0/i;->Y(I)LD0/i$d;

    .line 186
    .line 187
    .line 188
    move-result-object v3

    .line 189
    invoke-virtual {v1, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    invoke-virtual {v3, v1, v5}, LD0/i$d;->c(Ljava/lang/String;F)V

    .line 194
    .line 195
    .line 196
    :cond_8
    iget-object v0, v0, LD0/i;->K:Ljava/util/List;

    .line 197
    .line 198
    invoke-interface {v0, v2, v6}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    return-object v0
.end method


# virtual methods
.method public e(Ljava/lang/Object;LI0/c;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "LI0/c<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, LD0/b;->e(Ljava/lang/Object;LI0/c;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lv0/u;->a:Ljava/lang/Integer;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-ne p1, v0, :cond_2

    .line 8
    .line 9
    iget-object p1, p0, LD0/i;->P:Ly0/a;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1}, LD0/b;->G(Ly0/a;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    if-nez p2, :cond_1

    .line 17
    .line 18
    iput-object v1, p0, LD0/i;->P:Ly0/a;

    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    new-instance p1, Ly0/q;

    .line 22
    .line 23
    invoke-direct {p1, p2}, Ly0/q;-><init>(LI0/c;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, LD0/i;->P:Ly0/a;

    .line 27
    .line 28
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, LD0/i;->P:Ly0/a;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, LD0/b;->j(Ly0/a;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    sget-object v0, Lv0/u;->b:Ljava/lang/Integer;

    .line 38
    .line 39
    if-ne p1, v0, :cond_5

    .line 40
    .line 41
    iget-object p1, p0, LD0/i;->R:Ly0/a;

    .line 42
    .line 43
    if-eqz p1, :cond_3

    .line 44
    .line 45
    invoke-virtual {p0, p1}, LD0/b;->G(Ly0/a;)V

    .line 46
    .line 47
    .line 48
    :cond_3
    if-nez p2, :cond_4

    .line 49
    .line 50
    iput-object v1, p0, LD0/i;->R:Ly0/a;

    .line 51
    .line 52
    return-void

    .line 53
    :cond_4
    new-instance p1, Ly0/q;

    .line 54
    .line 55
    invoke-direct {p1, p2}, Ly0/q;-><init>(LI0/c;)V

    .line 56
    .line 57
    .line 58
    iput-object p1, p0, LD0/i;->R:Ly0/a;

    .line 59
    .line 60
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, LD0/i;->R:Ly0/a;

    .line 64
    .line 65
    invoke-virtual {p0, p1}, LD0/b;->j(Ly0/a;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_5
    sget-object v0, Lv0/u;->s:Ljava/lang/Float;

    .line 70
    .line 71
    if-ne p1, v0, :cond_8

    .line 72
    .line 73
    iget-object p1, p0, LD0/i;->T:Ly0/a;

    .line 74
    .line 75
    if-eqz p1, :cond_6

    .line 76
    .line 77
    invoke-virtual {p0, p1}, LD0/b;->G(Ly0/a;)V

    .line 78
    .line 79
    .line 80
    :cond_6
    if-nez p2, :cond_7

    .line 81
    .line 82
    iput-object v1, p0, LD0/i;->T:Ly0/a;

    .line 83
    .line 84
    return-void

    .line 85
    :cond_7
    new-instance p1, Ly0/q;

    .line 86
    .line 87
    invoke-direct {p1, p2}, Ly0/q;-><init>(LI0/c;)V

    .line 88
    .line 89
    .line 90
    iput-object p1, p0, LD0/i;->T:Ly0/a;

    .line 91
    .line 92
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, LD0/i;->T:Ly0/a;

    .line 96
    .line 97
    invoke-virtual {p0, p1}, LD0/b;->j(Ly0/a;)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_8
    sget-object v0, Lv0/u;->t:Ljava/lang/Float;

    .line 102
    .line 103
    if-ne p1, v0, :cond_b

    .line 104
    .line 105
    iget-object p1, p0, LD0/i;->V:Ly0/a;

    .line 106
    .line 107
    if-eqz p1, :cond_9

    .line 108
    .line 109
    invoke-virtual {p0, p1}, LD0/b;->G(Ly0/a;)V

    .line 110
    .line 111
    .line 112
    :cond_9
    if-nez p2, :cond_a

    .line 113
    .line 114
    iput-object v1, p0, LD0/i;->V:Ly0/a;

    .line 115
    .line 116
    return-void

    .line 117
    :cond_a
    new-instance p1, Ly0/q;

    .line 118
    .line 119
    invoke-direct {p1, p2}, Ly0/q;-><init>(LI0/c;)V

    .line 120
    .line 121
    .line 122
    iput-object p1, p0, LD0/i;->V:Ly0/a;

    .line 123
    .line 124
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 125
    .line 126
    .line 127
    iget-object p1, p0, LD0/i;->V:Ly0/a;

    .line 128
    .line 129
    invoke-virtual {p0, p1}, LD0/b;->j(Ly0/a;)V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :cond_b
    sget-object v0, Lv0/u;->F:Ljava/lang/Float;

    .line 134
    .line 135
    if-ne p1, v0, :cond_e

    .line 136
    .line 137
    iget-object p1, p0, LD0/i;->W:Ly0/a;

    .line 138
    .line 139
    if-eqz p1, :cond_c

    .line 140
    .line 141
    invoke-virtual {p0, p1}, LD0/b;->G(Ly0/a;)V

    .line 142
    .line 143
    .line 144
    :cond_c
    if-nez p2, :cond_d

    .line 145
    .line 146
    iput-object v1, p0, LD0/i;->W:Ly0/a;

    .line 147
    .line 148
    return-void

    .line 149
    :cond_d
    new-instance p1, Ly0/q;

    .line 150
    .line 151
    invoke-direct {p1, p2}, Ly0/q;-><init>(LI0/c;)V

    .line 152
    .line 153
    .line 154
    iput-object p1, p0, LD0/i;->W:Ly0/a;

    .line 155
    .line 156
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 157
    .line 158
    .line 159
    iget-object p1, p0, LD0/i;->W:Ly0/a;

    .line 160
    .line 161
    invoke-virtual {p0, p1}, LD0/b;->j(Ly0/a;)V

    .line 162
    .line 163
    .line 164
    return-void

    .line 165
    :cond_e
    sget-object v0, Lv0/u;->M:Landroid/graphics/Typeface;

    .line 166
    .line 167
    if-ne p1, v0, :cond_11

    .line 168
    .line 169
    iget-object p1, p0, LD0/i;->X:Ly0/a;

    .line 170
    .line 171
    if-eqz p1, :cond_f

    .line 172
    .line 173
    invoke-virtual {p0, p1}, LD0/b;->G(Ly0/a;)V

    .line 174
    .line 175
    .line 176
    :cond_f
    if-nez p2, :cond_10

    .line 177
    .line 178
    iput-object v1, p0, LD0/i;->X:Ly0/a;

    .line 179
    .line 180
    return-void

    .line 181
    :cond_10
    new-instance p1, Ly0/q;

    .line 182
    .line 183
    invoke-direct {p1, p2}, Ly0/q;-><init>(LI0/c;)V

    .line 184
    .line 185
    .line 186
    iput-object p1, p0, LD0/i;->X:Ly0/a;

    .line 187
    .line 188
    invoke-virtual {p1, p0}, Ly0/a;->a(Ly0/a$b;)V

    .line 189
    .line 190
    .line 191
    iget-object p1, p0, LD0/i;->X:Ly0/a;

    .line 192
    .line 193
    invoke-virtual {p0, p1}, LD0/b;->j(Ly0/a;)V

    .line 194
    .line 195
    .line 196
    return-void

    .line 197
    :cond_11
    sget-object v0, Lv0/u;->O:Ljava/lang/CharSequence;

    .line 198
    .line 199
    if-ne p1, v0, :cond_12

    .line 200
    .line 201
    iget-object p0, p0, LD0/i;->L:Ly0/o;

    .line 202
    .line 203
    invoke-virtual {p0, p2}, Ly0/o;->q(LI0/c;)V

    .line 204
    .line 205
    .line 206
    :cond_12
    return-void
.end method

.method public g(Landroid/graphics/RectF;Landroid/graphics/Matrix;Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, LD0/b;->g(Landroid/graphics/RectF;Landroid/graphics/Matrix;Z)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, LD0/i;->N:Lv0/h;

    .line 5
    .line 6
    invoke-virtual {p2}, Lv0/h;->b()Landroid/graphics/Rect;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    int-to-float p2, p2

    .line 15
    iget-object p0, p0, LD0/i;->N:Lv0/h;

    .line 16
    .line 17
    invoke-virtual {p0}, Lv0/h;->b()Landroid/graphics/Rect;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    int-to-float p0, p0

    .line 26
    const/4 p3, 0x0

    .line 27
    invoke-virtual {p1, p3, p3, p2, p0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method u(Landroid/graphics/Canvas;Landroid/graphics/Matrix;I)V
    .locals 2

    .line 1
    iget-object p3, p0, LD0/i;->L:Ly0/o;

    .line 2
    .line 3
    invoke-virtual {p3}, Ly0/a;->h()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    check-cast p3, LA0/b;

    .line 8
    .line 9
    iget-object v0, p0, LD0/i;->N:Lv0/h;

    .line 10
    .line 11
    invoke-virtual {v0}, Lv0/h;->g()Ljava/util/Map;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p3, LA0/b;->b:Ljava/lang/String;

    .line 16
    .line 17
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, LA0/c;

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, p2}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 30
    .line 31
    .line 32
    invoke-direct {p0, p3, p2}, LD0/i;->P(LA0/b;Landroid/graphics/Matrix;)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, LD0/i;->M:Lcom/airbnb/lottie/n;

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/airbnb/lottie/n;->N0()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    invoke-direct {p0, p3, p2, v0, p1}, LD0/i;->X(LA0/b;Landroid/graphics/Matrix;LA0/c;Landroid/graphics/Canvas;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    invoke-direct {p0, p3, v0, p1}, LD0/i;->W(LA0/b;LA0/c;Landroid/graphics/Canvas;)V

    .line 48
    .line 49
    .line 50
    :goto_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 51
    .line 52
    .line 53
    return-void
.end method
