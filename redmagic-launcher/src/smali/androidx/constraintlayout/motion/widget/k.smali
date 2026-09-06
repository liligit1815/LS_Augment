.class public Landroidx/constraintlayout/motion/widget/k;
.super Landroidx/constraintlayout/motion/widget/d;
.source "KeyTrigger.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/motion/widget/k$a;
    }
.end annotation


# instance fields
.field private A:Z

.field g:F

.field h:I

.field i:I

.field j:I

.field k:Landroid/graphics/RectF;

.field l:Landroid/graphics/RectF;

.field m:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation
.end field

.field private n:I

.field private o:Ljava/lang/String;

.field private p:I

.field private q:Ljava/lang/String;

.field private r:Ljava/lang/String;

.field private s:I

.field private t:I

.field private u:Landroid/view/View;

.field private v:Z

.field private w:Z

.field private x:Z

.field private y:F

.field private z:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroidx/constraintlayout/motion/widget/d;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, 0x3dcccccd    # 0.1f

    .line 5
    .line 6
    .line 7
    iput v0, p0, Landroidx/constraintlayout/motion/widget/k;->g:F

    .line 8
    .line 9
    sget v0, Landroidx/constraintlayout/motion/widget/d;->f:I

    .line 10
    .line 11
    iput v0, p0, Landroidx/constraintlayout/motion/widget/k;->h:I

    .line 12
    .line 13
    iput v0, p0, Landroidx/constraintlayout/motion/widget/k;->i:I

    .line 14
    .line 15
    iput v0, p0, Landroidx/constraintlayout/motion/widget/k;->j:I

    .line 16
    .line 17
    new-instance v0, Landroid/graphics/RectF;

    .line 18
    .line 19
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/k;->k:Landroid/graphics/RectF;

    .line 23
    .line 24
    new-instance v0, Landroid/graphics/RectF;

    .line 25
    .line 26
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/k;->l:Landroid/graphics/RectF;

    .line 30
    .line 31
    new-instance v0, Ljava/util/HashMap;

    .line 32
    .line 33
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/k;->m:Ljava/util/HashMap;

    .line 37
    .line 38
    const/4 v0, -0x1

    .line 39
    iput v0, p0, Landroidx/constraintlayout/motion/widget/k;->n:I

    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/k;->o:Ljava/lang/String;

    .line 43
    .line 44
    sget v1, Landroidx/constraintlayout/motion/widget/d;->f:I

    .line 45
    .line 46
    iput v1, p0, Landroidx/constraintlayout/motion/widget/k;->p:I

    .line 47
    .line 48
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/k;->q:Ljava/lang/String;

    .line 49
    .line 50
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/k;->r:Ljava/lang/String;

    .line 51
    .line 52
    iput v1, p0, Landroidx/constraintlayout/motion/widget/k;->s:I

    .line 53
    .line 54
    iput v1, p0, Landroidx/constraintlayout/motion/widget/k;->t:I

    .line 55
    .line 56
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/k;->u:Landroid/view/View;

    .line 57
    .line 58
    const/4 v0, 0x1

    .line 59
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/k;->v:Z

    .line 60
    .line 61
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/k;->w:Z

    .line 62
    .line 63
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/k;->x:Z

    .line 64
    .line 65
    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 66
    .line 67
    iput v0, p0, Landroidx/constraintlayout/motion/widget/k;->y:F

    .line 68
    .line 69
    const/4 v0, 0x0

    .line 70
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/k;->A:Z

    .line 71
    .line 72
    const/4 v0, 0x5

    .line 73
    iput v0, p0, Landroidx/constraintlayout/motion/widget/d;->d:I

    .line 74
    .line 75
    new-instance v0, Ljava/util/HashMap;

    .line 76
    .line 77
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 78
    .line 79
    .line 80
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/d;->e:Ljava/util/HashMap;

    .line 81
    .line 82
    return-void
.end method

.method static synthetic h(Landroidx/constraintlayout/motion/widget/k;F)F
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/motion/widget/k;->y:F

    .line 2
    .line 3
    return p1
.end method

.method static synthetic i(Landroidx/constraintlayout/motion/widget/k;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/k;->q:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic j(Landroidx/constraintlayout/motion/widget/k;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/k;->r:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic k(Landroidx/constraintlayout/motion/widget/k;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/k;->o:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic l(Landroidx/constraintlayout/motion/widget/k;)I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/k;->s:I

    .line 2
    .line 3
    return p0
.end method

.method static synthetic m(Landroidx/constraintlayout/motion/widget/k;I)I
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/motion/widget/k;->s:I

    .line 2
    .line 3
    return p1
.end method

.method static synthetic n(Landroidx/constraintlayout/motion/widget/k;)I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/k;->t:I

    .line 2
    .line 3
    return p0
.end method

.method static synthetic o(Landroidx/constraintlayout/motion/widget/k;I)I
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/motion/widget/k;->t:I

    .line 2
    .line 3
    return p1
.end method

.method static synthetic p(Landroidx/constraintlayout/motion/widget/k;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/constraintlayout/motion/widget/k;->A:Z

    .line 2
    .line 3
    return p0
.end method

.method static synthetic q(Landroidx/constraintlayout/motion/widget/k;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/constraintlayout/motion/widget/k;->A:Z

    .line 2
    .line 3
    return p1
.end method

.method static synthetic r(Landroidx/constraintlayout/motion/widget/k;)I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/k;->p:I

    .line 2
    .line 3
    return p0
.end method

.method static synthetic s(Landroidx/constraintlayout/motion/widget/k;I)I
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/motion/widget/k;->p:I

    .line 2
    .line 3
    return p1
.end method

.method private u(Ljava/lang/String;Landroid/view/View;)V
    .locals 7

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_1

    .line 4
    .line 5
    :cond_0
    const-string v0, "."

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/motion/widget/k;->v(Ljava/lang/String;Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/k;->m:Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x0

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/k;->m:Ljava/util/HashMap;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ljava/lang/reflect/Method;

    .line 33
    .line 34
    if-nez v0, :cond_3

    .line 35
    .line 36
    goto/16 :goto_1

    .line 37
    .line 38
    :cond_2
    move-object v0, v1

    .line 39
    :cond_3
    const-string v2, " "

    .line 40
    .line 41
    const-string v3, "\"on class "

    .line 42
    .line 43
    const-string v4, "KeyTrigger"

    .line 44
    .line 45
    const/4 v5, 0x0

    .line 46
    if-nez v0, :cond_4

    .line 47
    .line 48
    :try_start_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-array v6, v5, [Ljava/lang/Class;

    .line 53
    .line 54
    invoke-virtual {v0, p1, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget-object v6, p0, Landroidx/constraintlayout/motion/widget/k;->m:Ljava/util/HashMap;

    .line 59
    .line 60
    invoke-virtual {v6, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :catch_0
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/k;->m:Ljava/util/HashMap;

    .line 65
    .line 66
    invoke-virtual {p0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    new-instance p0, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    const-string v0, "Could not find method \""

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-static {p2}, Landroidx/constraintlayout/motion/widget/a;->c(Landroid/view/View;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-static {v4, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_4
    :goto_0
    :try_start_1
    new-array p1, v5, [Ljava/lang/Object;

    .line 115
    .line 116
    invoke-virtual {v0, p2, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :catch_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 123
    .line 124
    .line 125
    const-string v0, "Exception in call \""

    .line 126
    .line 127
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/k;->o:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-static {p2}, Landroidx/constraintlayout/motion/widget/a;->c(Landroid/view/View;)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-static {v4, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    .line 165
    .line 166
    :goto_1
    return-void
.end method

.method private v(Ljava/lang/String;Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    move v0, v1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 18
    .line 19
    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    :cond_1
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/d;->e:Ljava/util/HashMap;

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_4

    .line 38
    .line 39
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Ljava/lang/String;

    .line 44
    .line 45
    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 46
    .line 47
    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    if-nez v0, :cond_3

    .line 52
    .line 53
    invoke-virtual {v3, p1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    if-eqz v3, :cond_2

    .line 58
    .line 59
    :cond_3
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/d;->e:Ljava/util/HashMap;

    .line 60
    .line 61
    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    check-cast v2, Landroidx/constraintlayout/widget/a;

    .line 66
    .line 67
    if-eqz v2, :cond_2

    .line 68
    .line 69
    invoke-virtual {v2, p2}, Landroidx/constraintlayout/widget/a;->a(Landroid/view/View;)V

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_4
    return-void
.end method

.method private w(Landroid/graphics/RectF;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-float p0, p0

    .line 6
    iput p0, p1, Landroid/graphics/RectF;->top:F

    .line 7
    .line 8
    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    int-to-float p0, p0

    .line 13
    iput p0, p1, Landroid/graphics/RectF;->bottom:F

    .line 14
    .line 15
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    int-to-float p0, p0

    .line 20
    iput p0, p1, Landroid/graphics/RectF;->left:F

    .line 21
    .line 22
    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    int-to-float p0, p0

    .line 27
    iput p0, p1, Landroid/graphics/RectF;->right:F

    .line 28
    .line 29
    if-eqz p3, :cond_0

    .line 30
    .line 31
    invoke-virtual {p2}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lv/c;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public b()Landroidx/constraintlayout/motion/widget/d;
    .locals 1

    .line 1
    new-instance v0, Landroidx/constraintlayout/motion/widget/k;

    .line 2
    .line 3
    invoke-direct {v0}, Landroidx/constraintlayout/motion/widget/k;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Landroidx/constraintlayout/motion/widget/k;->c(Landroidx/constraintlayout/motion/widget/d;)Landroidx/constraintlayout/motion/widget/d;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public c(Landroidx/constraintlayout/motion/widget/d;)Landroidx/constraintlayout/motion/widget/d;
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/constraintlayout/motion/widget/d;->c(Landroidx/constraintlayout/motion/widget/d;)Landroidx/constraintlayout/motion/widget/d;

    .line 2
    .line 3
    .line 4
    check-cast p1, Landroidx/constraintlayout/motion/widget/k;

    .line 5
    .line 6
    iget v0, p1, Landroidx/constraintlayout/motion/widget/k;->n:I

    .line 7
    .line 8
    iput v0, p0, Landroidx/constraintlayout/motion/widget/k;->n:I

    .line 9
    .line 10
    iget-object v0, p1, Landroidx/constraintlayout/motion/widget/k;->o:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/k;->o:Ljava/lang/String;

    .line 13
    .line 14
    iget v0, p1, Landroidx/constraintlayout/motion/widget/k;->p:I

    .line 15
    .line 16
    iput v0, p0, Landroidx/constraintlayout/motion/widget/k;->p:I

    .line 17
    .line 18
    iget-object v0, p1, Landroidx/constraintlayout/motion/widget/k;->q:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/k;->q:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v0, p1, Landroidx/constraintlayout/motion/widget/k;->r:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/k;->r:Ljava/lang/String;

    .line 25
    .line 26
    iget v0, p1, Landroidx/constraintlayout/motion/widget/k;->s:I

    .line 27
    .line 28
    iput v0, p0, Landroidx/constraintlayout/motion/widget/k;->s:I

    .line 29
    .line 30
    iget v0, p1, Landroidx/constraintlayout/motion/widget/k;->t:I

    .line 31
    .line 32
    iput v0, p0, Landroidx/constraintlayout/motion/widget/k;->t:I

    .line 33
    .line 34
    iget-object v0, p1, Landroidx/constraintlayout/motion/widget/k;->u:Landroid/view/View;

    .line 35
    .line 36
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/k;->u:Landroid/view/View;

    .line 37
    .line 38
    iget v0, p1, Landroidx/constraintlayout/motion/widget/k;->g:F

    .line 39
    .line 40
    iput v0, p0, Landroidx/constraintlayout/motion/widget/k;->g:F

    .line 41
    .line 42
    iget-boolean v0, p1, Landroidx/constraintlayout/motion/widget/k;->v:Z

    .line 43
    .line 44
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/k;->v:Z

    .line 45
    .line 46
    iget-boolean v0, p1, Landroidx/constraintlayout/motion/widget/k;->w:Z

    .line 47
    .line 48
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/k;->w:Z

    .line 49
    .line 50
    iget-boolean v0, p1, Landroidx/constraintlayout/motion/widget/k;->x:Z

    .line 51
    .line 52
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/k;->x:Z

    .line 53
    .line 54
    iget v0, p1, Landroidx/constraintlayout/motion/widget/k;->y:F

    .line 55
    .line 56
    iput v0, p0, Landroidx/constraintlayout/motion/widget/k;->y:F

    .line 57
    .line 58
    iget v0, p1, Landroidx/constraintlayout/motion/widget/k;->z:F

    .line 59
    .line 60
    iput v0, p0, Landroidx/constraintlayout/motion/widget/k;->z:F

    .line 61
    .line 62
    iget-boolean v0, p1, Landroidx/constraintlayout/motion/widget/k;->A:Z

    .line 63
    .line 64
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/k;->A:Z

    .line 65
    .line 66
    iget-object v0, p1, Landroidx/constraintlayout/motion/widget/k;->k:Landroid/graphics/RectF;

    .line 67
    .line 68
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/k;->k:Landroid/graphics/RectF;

    .line 69
    .line 70
    iget-object v0, p1, Landroidx/constraintlayout/motion/widget/k;->l:Landroid/graphics/RectF;

    .line 71
    .line 72
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/k;->l:Landroid/graphics/RectF;

    .line 73
    .line 74
    iget-object p1, p1, Landroidx/constraintlayout/motion/widget/k;->m:Ljava/util/HashMap;

    .line 75
    .line 76
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/k;->m:Ljava/util/HashMap;

    .line 77
    .line 78
    return-object p0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/k;->b()Landroidx/constraintlayout/motion/widget/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ljava/util/HashSet;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public e(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    sget-object v0, Landroidx/constraintlayout/widget/i;->s6:[I

    .line 2
    .line 3
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-static {p0, p2, p1}, Landroidx/constraintlayout/motion/widget/k$a;->a(Landroidx/constraintlayout/motion/widget/k;Landroid/content/res/TypedArray;Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public t(FLandroid/view/View;)V
    .locals 9

    .line 1
    iget v0, p0, Landroidx/constraintlayout/motion/widget/k;->t:I

    .line 2
    .line 3
    sget v1, Landroidx/constraintlayout/motion/widget/d;->f:I

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    if-eq v0, v1, :cond_6

    .line 8
    .line 9
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/k;->u:Landroid/view/View;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Landroid/view/ViewGroup;

    .line 18
    .line 19
    iget v1, p0, Landroidx/constraintlayout/motion/widget/k;->t:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/k;->u:Landroid/view/View;

    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/k;->k:Landroid/graphics/RectF;

    .line 28
    .line 29
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/k;->u:Landroid/view/View;

    .line 30
    .line 31
    iget-boolean v4, p0, Landroidx/constraintlayout/motion/widget/k;->A:Z

    .line 32
    .line 33
    invoke-direct {p0, v0, v1, v4}, Landroidx/constraintlayout/motion/widget/k;->w(Landroid/graphics/RectF;Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/k;->l:Landroid/graphics/RectF;

    .line 37
    .line 38
    iget-boolean v1, p0, Landroidx/constraintlayout/motion/widget/k;->A:Z

    .line 39
    .line 40
    invoke-direct {p0, v0, p2, v1}, Landroidx/constraintlayout/motion/widget/k;->w(Landroid/graphics/RectF;Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/k;->k:Landroid/graphics/RectF;

    .line 44
    .line 45
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/k;->l:Landroid/graphics/RectF;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->intersect(Landroid/graphics/RectF;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    iget-boolean v0, p0, Landroidx/constraintlayout/motion/widget/k;->v:Z

    .line 54
    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    iput-boolean v3, p0, Landroidx/constraintlayout/motion/widget/k;->v:Z

    .line 58
    .line 59
    move v0, v2

    .line 60
    goto :goto_0

    .line 61
    :cond_1
    move v0, v3

    .line 62
    :goto_0
    iget-boolean v1, p0, Landroidx/constraintlayout/motion/widget/k;->x:Z

    .line 63
    .line 64
    if-eqz v1, :cond_2

    .line 65
    .line 66
    iput-boolean v3, p0, Landroidx/constraintlayout/motion/widget/k;->x:Z

    .line 67
    .line 68
    move v1, v2

    .line 69
    goto :goto_1

    .line 70
    :cond_2
    move v1, v3

    .line 71
    :goto_1
    iput-boolean v2, p0, Landroidx/constraintlayout/motion/widget/k;->w:Z

    .line 72
    .line 73
    goto/16 :goto_8

    .line 74
    .line 75
    :cond_3
    iget-boolean v0, p0, Landroidx/constraintlayout/motion/widget/k;->v:Z

    .line 76
    .line 77
    if-nez v0, :cond_4

    .line 78
    .line 79
    iput-boolean v2, p0, Landroidx/constraintlayout/motion/widget/k;->v:Z

    .line 80
    .line 81
    move v0, v2

    .line 82
    goto :goto_2

    .line 83
    :cond_4
    move v0, v3

    .line 84
    :goto_2
    iget-boolean v1, p0, Landroidx/constraintlayout/motion/widget/k;->w:Z

    .line 85
    .line 86
    if-eqz v1, :cond_5

    .line 87
    .line 88
    iput-boolean v3, p0, Landroidx/constraintlayout/motion/widget/k;->w:Z

    .line 89
    .line 90
    move v1, v2

    .line 91
    goto :goto_3

    .line 92
    :cond_5
    move v1, v3

    .line 93
    :goto_3
    iput-boolean v2, p0, Landroidx/constraintlayout/motion/widget/k;->x:Z

    .line 94
    .line 95
    move v8, v3

    .line 96
    move v3, v1

    .line 97
    move v1, v8

    .line 98
    goto/16 :goto_8

    .line 99
    .line 100
    :cond_6
    iget-boolean v0, p0, Landroidx/constraintlayout/motion/widget/k;->v:Z

    .line 101
    .line 102
    const/4 v1, 0x0

    .line 103
    if-eqz v0, :cond_7

    .line 104
    .line 105
    iget v0, p0, Landroidx/constraintlayout/motion/widget/k;->y:F

    .line 106
    .line 107
    sub-float v4, p1, v0

    .line 108
    .line 109
    iget v5, p0, Landroidx/constraintlayout/motion/widget/k;->z:F

    .line 110
    .line 111
    sub-float/2addr v5, v0

    .line 112
    mul-float/2addr v4, v5

    .line 113
    cmpg-float v0, v4, v1

    .line 114
    .line 115
    if-gez v0, :cond_8

    .line 116
    .line 117
    iput-boolean v3, p0, Landroidx/constraintlayout/motion/widget/k;->v:Z

    .line 118
    .line 119
    move v0, v2

    .line 120
    goto :goto_4

    .line 121
    :cond_7
    iget v0, p0, Landroidx/constraintlayout/motion/widget/k;->y:F

    .line 122
    .line 123
    sub-float v0, p1, v0

    .line 124
    .line 125
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    iget v4, p0, Landroidx/constraintlayout/motion/widget/k;->g:F

    .line 130
    .line 131
    cmpl-float v0, v0, v4

    .line 132
    .line 133
    if-lez v0, :cond_8

    .line 134
    .line 135
    iput-boolean v2, p0, Landroidx/constraintlayout/motion/widget/k;->v:Z

    .line 136
    .line 137
    :cond_8
    move v0, v3

    .line 138
    :goto_4
    iget-boolean v4, p0, Landroidx/constraintlayout/motion/widget/k;->w:Z

    .line 139
    .line 140
    if-eqz v4, :cond_9

    .line 141
    .line 142
    iget v4, p0, Landroidx/constraintlayout/motion/widget/k;->y:F

    .line 143
    .line 144
    sub-float v5, p1, v4

    .line 145
    .line 146
    iget v6, p0, Landroidx/constraintlayout/motion/widget/k;->z:F

    .line 147
    .line 148
    sub-float/2addr v6, v4

    .line 149
    mul-float/2addr v6, v5

    .line 150
    cmpg-float v4, v6, v1

    .line 151
    .line 152
    if-gez v4, :cond_a

    .line 153
    .line 154
    cmpg-float v4, v5, v1

    .line 155
    .line 156
    if-gez v4, :cond_a

    .line 157
    .line 158
    iput-boolean v3, p0, Landroidx/constraintlayout/motion/widget/k;->w:Z

    .line 159
    .line 160
    move v4, v2

    .line 161
    goto :goto_5

    .line 162
    :cond_9
    iget v4, p0, Landroidx/constraintlayout/motion/widget/k;->y:F

    .line 163
    .line 164
    sub-float v4, p1, v4

    .line 165
    .line 166
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 167
    .line 168
    .line 169
    move-result v4

    .line 170
    iget v5, p0, Landroidx/constraintlayout/motion/widget/k;->g:F

    .line 171
    .line 172
    cmpl-float v4, v4, v5

    .line 173
    .line 174
    if-lez v4, :cond_a

    .line 175
    .line 176
    iput-boolean v2, p0, Landroidx/constraintlayout/motion/widget/k;->w:Z

    .line 177
    .line 178
    :cond_a
    move v4, v3

    .line 179
    :goto_5
    iget-boolean v5, p0, Landroidx/constraintlayout/motion/widget/k;->x:Z

    .line 180
    .line 181
    if-eqz v5, :cond_c

    .line 182
    .line 183
    iget v5, p0, Landroidx/constraintlayout/motion/widget/k;->y:F

    .line 184
    .line 185
    sub-float v6, p1, v5

    .line 186
    .line 187
    iget v7, p0, Landroidx/constraintlayout/motion/widget/k;->z:F

    .line 188
    .line 189
    sub-float/2addr v7, v5

    .line 190
    mul-float/2addr v7, v6

    .line 191
    cmpg-float v5, v7, v1

    .line 192
    .line 193
    if-gez v5, :cond_b

    .line 194
    .line 195
    cmpl-float v1, v6, v1

    .line 196
    .line 197
    if-lez v1, :cond_b

    .line 198
    .line 199
    iput-boolean v3, p0, Landroidx/constraintlayout/motion/widget/k;->x:Z

    .line 200
    .line 201
    goto :goto_6

    .line 202
    :cond_b
    move v2, v3

    .line 203
    :goto_6
    move v1, v2

    .line 204
    :goto_7
    move v3, v4

    .line 205
    goto :goto_8

    .line 206
    :cond_c
    iget v1, p0, Landroidx/constraintlayout/motion/widget/k;->y:F

    .line 207
    .line 208
    sub-float v1, p1, v1

    .line 209
    .line 210
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    iget v5, p0, Landroidx/constraintlayout/motion/widget/k;->g:F

    .line 215
    .line 216
    cmpl-float v1, v1, v5

    .line 217
    .line 218
    if-lez v1, :cond_d

    .line 219
    .line 220
    iput-boolean v2, p0, Landroidx/constraintlayout/motion/widget/k;->x:Z

    .line 221
    .line 222
    :cond_d
    move v1, v3

    .line 223
    goto :goto_7

    .line 224
    :goto_8
    iput p1, p0, Landroidx/constraintlayout/motion/widget/k;->z:F

    .line 225
    .line 226
    if-nez v3, :cond_e

    .line 227
    .line 228
    if-nez v0, :cond_e

    .line 229
    .line 230
    if-eqz v1, :cond_f

    .line 231
    .line 232
    :cond_e
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 233
    .line 234
    .line 235
    move-result-object v2

    .line 236
    check-cast v2, Landroidx/constraintlayout/motion/widget/p;

    .line 237
    .line 238
    iget v4, p0, Landroidx/constraintlayout/motion/widget/k;->s:I

    .line 239
    .line 240
    invoke-virtual {v2, v4, v1, p1}, Landroidx/constraintlayout/motion/widget/p;->s(IZF)V

    .line 241
    .line 242
    .line 243
    :cond_f
    iget p1, p0, Landroidx/constraintlayout/motion/widget/k;->p:I

    .line 244
    .line 245
    sget v2, Landroidx/constraintlayout/motion/widget/d;->f:I

    .line 246
    .line 247
    if-ne p1, v2, :cond_10

    .line 248
    .line 249
    move-object p1, p2

    .line 250
    goto :goto_9

    .line 251
    :cond_10
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 252
    .line 253
    .line 254
    move-result-object p1

    .line 255
    check-cast p1, Landroidx/constraintlayout/motion/widget/p;

    .line 256
    .line 257
    iget v2, p0, Landroidx/constraintlayout/motion/widget/k;->p:I

    .line 258
    .line 259
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    :goto_9
    if-eqz v3, :cond_12

    .line 264
    .line 265
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/k;->q:Ljava/lang/String;

    .line 266
    .line 267
    if-eqz v2, :cond_11

    .line 268
    .line 269
    invoke-direct {p0, v2, p1}, Landroidx/constraintlayout/motion/widget/k;->u(Ljava/lang/String;Landroid/view/View;)V

    .line 270
    .line 271
    .line 272
    :cond_11
    iget v2, p0, Landroidx/constraintlayout/motion/widget/k;->h:I

    .line 273
    .line 274
    sget v3, Landroidx/constraintlayout/motion/widget/d;->f:I

    .line 275
    .line 276
    if-eq v2, v3, :cond_12

    .line 277
    .line 278
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 279
    .line 280
    .line 281
    move-result-object v2

    .line 282
    check-cast v2, Landroidx/constraintlayout/motion/widget/p;

    .line 283
    .line 284
    iget v3, p0, Landroidx/constraintlayout/motion/widget/k;->h:I

    .line 285
    .line 286
    filled-new-array {p1}, [Landroid/view/View;

    .line 287
    .line 288
    .line 289
    move-result-object v4

    .line 290
    invoke-virtual {v2, v3, v4}, Landroidx/constraintlayout/motion/widget/p;->O(I[Landroid/view/View;)V

    .line 291
    .line 292
    .line 293
    :cond_12
    if-eqz v1, :cond_14

    .line 294
    .line 295
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/k;->r:Ljava/lang/String;

    .line 296
    .line 297
    if-eqz v1, :cond_13

    .line 298
    .line 299
    invoke-direct {p0, v1, p1}, Landroidx/constraintlayout/motion/widget/k;->u(Ljava/lang/String;Landroid/view/View;)V

    .line 300
    .line 301
    .line 302
    :cond_13
    iget v1, p0, Landroidx/constraintlayout/motion/widget/k;->i:I

    .line 303
    .line 304
    sget v2, Landroidx/constraintlayout/motion/widget/d;->f:I

    .line 305
    .line 306
    if-eq v1, v2, :cond_14

    .line 307
    .line 308
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 309
    .line 310
    .line 311
    move-result-object v1

    .line 312
    check-cast v1, Landroidx/constraintlayout/motion/widget/p;

    .line 313
    .line 314
    iget v2, p0, Landroidx/constraintlayout/motion/widget/k;->i:I

    .line 315
    .line 316
    filled-new-array {p1}, [Landroid/view/View;

    .line 317
    .line 318
    .line 319
    move-result-object v3

    .line 320
    invoke-virtual {v1, v2, v3}, Landroidx/constraintlayout/motion/widget/p;->O(I[Landroid/view/View;)V

    .line 321
    .line 322
    .line 323
    :cond_14
    if-eqz v0, :cond_16

    .line 324
    .line 325
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/k;->o:Ljava/lang/String;

    .line 326
    .line 327
    if-eqz v0, :cond_15

    .line 328
    .line 329
    invoke-direct {p0, v0, p1}, Landroidx/constraintlayout/motion/widget/k;->u(Ljava/lang/String;Landroid/view/View;)V

    .line 330
    .line 331
    .line 332
    :cond_15
    iget v0, p0, Landroidx/constraintlayout/motion/widget/k;->j:I

    .line 333
    .line 334
    sget v1, Landroidx/constraintlayout/motion/widget/d;->f:I

    .line 335
    .line 336
    if-eq v0, v1, :cond_16

    .line 337
    .line 338
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 339
    .line 340
    .line 341
    move-result-object p2

    .line 342
    check-cast p2, Landroidx/constraintlayout/motion/widget/p;

    .line 343
    .line 344
    iget p0, p0, Landroidx/constraintlayout/motion/widget/k;->j:I

    .line 345
    .line 346
    filled-new-array {p1}, [Landroid/view/View;

    .line 347
    .line 348
    .line 349
    move-result-object p1

    .line 350
    invoke-virtual {p2, p0, p1}, Landroidx/constraintlayout/motion/widget/p;->O(I[Landroid/view/View;)V

    .line 351
    .line 352
    .line 353
    :cond_16
    return-void
.end method
