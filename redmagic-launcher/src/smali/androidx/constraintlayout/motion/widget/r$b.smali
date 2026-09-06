.class public Landroidx/constraintlayout/motion/widget/r$b;
.super Ljava/lang/Object;
.source "MotionScene.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/motion/widget/r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/motion/widget/r$b$a;
    }
.end annotation


# instance fields
.field private a:I

.field private b:Z

.field private c:I

.field private d:I

.field private e:I

.field private f:Ljava/lang/String;

.field private g:I

.field private h:I

.field private i:F

.field private final j:Landroidx/constraintlayout/motion/widget/r;

.field private k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/motion/widget/g;",
            ">;"
        }
    .end annotation
.end field

.field private l:Landroidx/constraintlayout/motion/widget/s;

.field private m:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/motion/widget/r$b$a;",
            ">;"
        }
    .end annotation
.end field

.field private n:I

.field private o:Z

.field private p:I

.field private q:I

.field private r:I


# direct methods
.method public constructor <init>(ILandroidx/constraintlayout/motion/widget/r;II)V
    .locals 4

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 30
    iput v0, p0, Landroidx/constraintlayout/motion/widget/r$b;->a:I

    const/4 v1, 0x0

    .line 31
    iput-boolean v1, p0, Landroidx/constraintlayout/motion/widget/r$b;->b:Z

    .line 32
    iput v0, p0, Landroidx/constraintlayout/motion/widget/r$b;->c:I

    .line 33
    iput v0, p0, Landroidx/constraintlayout/motion/widget/r$b;->d:I

    .line 34
    iput v1, p0, Landroidx/constraintlayout/motion/widget/r$b;->e:I

    const/4 v2, 0x0

    .line 35
    iput-object v2, p0, Landroidx/constraintlayout/motion/widget/r$b;->f:Ljava/lang/String;

    .line 36
    iput v0, p0, Landroidx/constraintlayout/motion/widget/r$b;->g:I

    const/16 v3, 0x190

    .line 37
    iput v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->h:I

    const/4 v3, 0x0

    .line 38
    iput v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->i:F

    .line 39
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->k:Ljava/util/ArrayList;

    .line 40
    iput-object v2, p0, Landroidx/constraintlayout/motion/widget/r$b;->l:Landroidx/constraintlayout/motion/widget/s;

    .line 41
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Landroidx/constraintlayout/motion/widget/r$b;->m:Ljava/util/ArrayList;

    .line 42
    iput v1, p0, Landroidx/constraintlayout/motion/widget/r$b;->n:I

    .line 43
    iput-boolean v1, p0, Landroidx/constraintlayout/motion/widget/r$b;->o:Z

    .line 44
    iput v0, p0, Landroidx/constraintlayout/motion/widget/r$b;->p:I

    .line 45
    iput v1, p0, Landroidx/constraintlayout/motion/widget/r$b;->q:I

    .line 46
    iput v1, p0, Landroidx/constraintlayout/motion/widget/r$b;->r:I

    .line 47
    iput p1, p0, Landroidx/constraintlayout/motion/widget/r$b;->a:I

    .line 48
    iput-object p2, p0, Landroidx/constraintlayout/motion/widget/r$b;->j:Landroidx/constraintlayout/motion/widget/r;

    .line 49
    iput p3, p0, Landroidx/constraintlayout/motion/widget/r$b;->d:I

    .line 50
    iput p4, p0, Landroidx/constraintlayout/motion/widget/r$b;->c:I

    .line 51
    invoke-static {p2}, Landroidx/constraintlayout/motion/widget/r;->e(Landroidx/constraintlayout/motion/widget/r;)I

    move-result p1

    iput p1, p0, Landroidx/constraintlayout/motion/widget/r$b;->h:I

    .line 52
    invoke-static {p2}, Landroidx/constraintlayout/motion/widget/r;->a(Landroidx/constraintlayout/motion/widget/r;)I

    move-result p1

    iput p1, p0, Landroidx/constraintlayout/motion/widget/r$b;->q:I

    return-void
.end method

.method constructor <init>(Landroidx/constraintlayout/motion/widget/r;Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 4

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 54
    iput v0, p0, Landroidx/constraintlayout/motion/widget/r$b;->a:I

    const/4 v1, 0x0

    .line 55
    iput-boolean v1, p0, Landroidx/constraintlayout/motion/widget/r$b;->b:Z

    .line 56
    iput v0, p0, Landroidx/constraintlayout/motion/widget/r$b;->c:I

    .line 57
    iput v0, p0, Landroidx/constraintlayout/motion/widget/r$b;->d:I

    .line 58
    iput v1, p0, Landroidx/constraintlayout/motion/widget/r$b;->e:I

    const/4 v2, 0x0

    .line 59
    iput-object v2, p0, Landroidx/constraintlayout/motion/widget/r$b;->f:Ljava/lang/String;

    .line 60
    iput v0, p0, Landroidx/constraintlayout/motion/widget/r$b;->g:I

    const/16 v3, 0x190

    .line 61
    iput v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->h:I

    const/4 v3, 0x0

    .line 62
    iput v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->i:F

    .line 63
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->k:Ljava/util/ArrayList;

    .line 64
    iput-object v2, p0, Landroidx/constraintlayout/motion/widget/r$b;->l:Landroidx/constraintlayout/motion/widget/s;

    .line 65
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Landroidx/constraintlayout/motion/widget/r$b;->m:Ljava/util/ArrayList;

    .line 66
    iput v1, p0, Landroidx/constraintlayout/motion/widget/r$b;->n:I

    .line 67
    iput-boolean v1, p0, Landroidx/constraintlayout/motion/widget/r$b;->o:Z

    .line 68
    iput v0, p0, Landroidx/constraintlayout/motion/widget/r$b;->p:I

    .line 69
    iput v1, p0, Landroidx/constraintlayout/motion/widget/r$b;->q:I

    .line 70
    iput v1, p0, Landroidx/constraintlayout/motion/widget/r$b;->r:I

    .line 71
    invoke-static {p1}, Landroidx/constraintlayout/motion/widget/r;->e(Landroidx/constraintlayout/motion/widget/r;)I

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/motion/widget/r$b;->h:I

    .line 72
    invoke-static {p1}, Landroidx/constraintlayout/motion/widget/r;->a(Landroidx/constraintlayout/motion/widget/r;)I

    move-result v0

    iput v0, p0, Landroidx/constraintlayout/motion/widget/r$b;->q:I

    .line 73
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/r$b;->j:Landroidx/constraintlayout/motion/widget/r;

    .line 74
    invoke-static {p3}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object p3

    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/motion/widget/r$b;->u(Landroidx/constraintlayout/motion/widget/r;Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method constructor <init>(Landroidx/constraintlayout/motion/widget/r;Landroidx/constraintlayout/motion/widget/r$b;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Landroidx/constraintlayout/motion/widget/r$b;->a:I

    const/4 v1, 0x0

    .line 3
    iput-boolean v1, p0, Landroidx/constraintlayout/motion/widget/r$b;->b:Z

    .line 4
    iput v0, p0, Landroidx/constraintlayout/motion/widget/r$b;->c:I

    .line 5
    iput v0, p0, Landroidx/constraintlayout/motion/widget/r$b;->d:I

    .line 6
    iput v1, p0, Landroidx/constraintlayout/motion/widget/r$b;->e:I

    const/4 v2, 0x0

    .line 7
    iput-object v2, p0, Landroidx/constraintlayout/motion/widget/r$b;->f:Ljava/lang/String;

    .line 8
    iput v0, p0, Landroidx/constraintlayout/motion/widget/r$b;->g:I

    const/16 v3, 0x190

    .line 9
    iput v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->h:I

    const/4 v3, 0x0

    .line 10
    iput v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->i:F

    .line 11
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->k:Ljava/util/ArrayList;

    .line 12
    iput-object v2, p0, Landroidx/constraintlayout/motion/widget/r$b;->l:Landroidx/constraintlayout/motion/widget/s;

    .line 13
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Landroidx/constraintlayout/motion/widget/r$b;->m:Ljava/util/ArrayList;

    .line 14
    iput v1, p0, Landroidx/constraintlayout/motion/widget/r$b;->n:I

    .line 15
    iput-boolean v1, p0, Landroidx/constraintlayout/motion/widget/r$b;->o:Z

    .line 16
    iput v0, p0, Landroidx/constraintlayout/motion/widget/r$b;->p:I

    .line 17
    iput v1, p0, Landroidx/constraintlayout/motion/widget/r$b;->q:I

    .line 18
    iput v1, p0, Landroidx/constraintlayout/motion/widget/r$b;->r:I

    .line 19
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/r$b;->j:Landroidx/constraintlayout/motion/widget/r;

    .line 20
    invoke-static {p1}, Landroidx/constraintlayout/motion/widget/r;->e(Landroidx/constraintlayout/motion/widget/r;)I

    move-result p1

    iput p1, p0, Landroidx/constraintlayout/motion/widget/r$b;->h:I

    if-eqz p2, :cond_0

    .line 21
    iget p1, p2, Landroidx/constraintlayout/motion/widget/r$b;->p:I

    iput p1, p0, Landroidx/constraintlayout/motion/widget/r$b;->p:I

    .line 22
    iget p1, p2, Landroidx/constraintlayout/motion/widget/r$b;->e:I

    iput p1, p0, Landroidx/constraintlayout/motion/widget/r$b;->e:I

    .line 23
    iget-object p1, p2, Landroidx/constraintlayout/motion/widget/r$b;->f:Ljava/lang/String;

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/r$b;->f:Ljava/lang/String;

    .line 24
    iget p1, p2, Landroidx/constraintlayout/motion/widget/r$b;->g:I

    iput p1, p0, Landroidx/constraintlayout/motion/widget/r$b;->g:I

    .line 25
    iget p1, p2, Landroidx/constraintlayout/motion/widget/r$b;->h:I

    iput p1, p0, Landroidx/constraintlayout/motion/widget/r$b;->h:I

    .line 26
    iget-object p1, p2, Landroidx/constraintlayout/motion/widget/r$b;->k:Ljava/util/ArrayList;

    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/r$b;->k:Ljava/util/ArrayList;

    .line 27
    iget p1, p2, Landroidx/constraintlayout/motion/widget/r$b;->i:F

    iput p1, p0, Landroidx/constraintlayout/motion/widget/r$b;->i:F

    .line 28
    iget p1, p2, Landroidx/constraintlayout/motion/widget/r$b;->q:I

    iput p1, p0, Landroidx/constraintlayout/motion/widget/r$b;->q:I

    :cond_0
    return-void
.end method

.method static synthetic a(Landroidx/constraintlayout/motion/widget/r$b;)I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/r$b;->c:I

    .line 2
    .line 3
    return p0
.end method

.method static synthetic b(Landroidx/constraintlayout/motion/widget/r$b;I)I
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/motion/widget/r$b;->c:I

    .line 2
    .line 3
    return p1
.end method

.method static synthetic c(Landroidx/constraintlayout/motion/widget/r$b;)I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/r$b;->d:I

    .line 2
    .line 3
    return p0
.end method

.method static synthetic d(Landroidx/constraintlayout/motion/widget/r$b;I)I
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/motion/widget/r$b;->d:I

    .line 2
    .line 3
    return p1
.end method

.method static synthetic e(Landroidx/constraintlayout/motion/widget/r$b;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/constraintlayout/motion/widget/r$b;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method static synthetic f(Landroidx/constraintlayout/motion/widget/r$b;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/r$b;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic g(Landroidx/constraintlayout/motion/widget/r$b;)I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/r$b;->e:I

    .line 2
    .line 3
    return p0
.end method

.method static synthetic h(Landroidx/constraintlayout/motion/widget/r$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/r$b;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic i(Landroidx/constraintlayout/motion/widget/r$b;)I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/r$b;->g:I

    .line 2
    .line 3
    return p0
.end method

.method static synthetic j(Landroidx/constraintlayout/motion/widget/r$b;)I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/r$b;->h:I

    .line 2
    .line 3
    return p0
.end method

.method static synthetic k(Landroidx/constraintlayout/motion/widget/r$b;)Landroidx/constraintlayout/motion/widget/s;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/r$b;->l:Landroidx/constraintlayout/motion/widget/s;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic l(Landroidx/constraintlayout/motion/widget/r$b;Landroidx/constraintlayout/motion/widget/s;)Landroidx/constraintlayout/motion/widget/s;
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/r$b;->l:Landroidx/constraintlayout/motion/widget/s;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic m(Landroidx/constraintlayout/motion/widget/r$b;)I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/r$b;->a:I

    .line 2
    .line 3
    return p0
.end method

.method static synthetic n(Landroidx/constraintlayout/motion/widget/r$b;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/r$b;->m:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic o(Landroidx/constraintlayout/motion/widget/r$b;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/constraintlayout/motion/widget/r$b;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method static synthetic p(Landroidx/constraintlayout/motion/widget/r$b;)I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/r$b;->n:I

    .line 2
    .line 3
    return p0
.end method

.method static synthetic q(Landroidx/constraintlayout/motion/widget/r$b;)Landroidx/constraintlayout/motion/widget/r;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/r$b;->j:Landroidx/constraintlayout/motion/widget/r;

    .line 2
    .line 3
    return-object p0
.end method

.method private t(Landroidx/constraintlayout/motion/widget/r;Landroid/content/Context;Landroid/content/res/TypedArray;)V
    .locals 9

    .line 1
    invoke-virtual {p3}, Landroid/content/res/TypedArray;->getIndexCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    const/4 v3, 0x1

    .line 8
    const/4 v4, -0x1

    .line 9
    if-ge v2, v0, :cond_10

    .line 10
    .line 11
    invoke-virtual {p3, v2}, Landroid/content/res/TypedArray;->getIndex(I)I

    .line 12
    .line 13
    .line 14
    move-result v5

    .line 15
    sget v6, Landroidx/constraintlayout/widget/i;->n9:I

    .line 16
    .line 17
    const-string v7, "xml"

    .line 18
    .line 19
    const-string v8, "layout"

    .line 20
    .line 21
    if-ne v5, v6, :cond_1

    .line 22
    .line 23
    invoke-virtual {p3, v5, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    iput v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->c:I

    .line 28
    .line 29
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    iget v4, p0, Landroidx/constraintlayout/motion/widget/r$b;->c:I

    .line 34
    .line 35
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getResourceTypeName(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    if-eqz v4, :cond_0

    .line 44
    .line 45
    new-instance v3, Landroidx/constraintlayout/widget/d;

    .line 46
    .line 47
    invoke-direct {v3}, Landroidx/constraintlayout/widget/d;-><init>()V

    .line 48
    .line 49
    .line 50
    iget v4, p0, Landroidx/constraintlayout/motion/widget/r$b;->c:I

    .line 51
    .line 52
    invoke-virtual {v3, p2, v4}, Landroidx/constraintlayout/widget/d;->x(Landroid/content/Context;I)V

    .line 53
    .line 54
    .line 55
    invoke-static {p1}, Landroidx/constraintlayout/motion/widget/r;->b(Landroidx/constraintlayout/motion/widget/r;)Landroid/util/SparseArray;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    iget v5, p0, Landroidx/constraintlayout/motion/widget/r$b;->c:I

    .line 60
    .line 61
    invoke-virtual {v4, v5, v3}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    goto/16 :goto_1

    .line 65
    .line 66
    :cond_0
    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-eqz v3, :cond_f

    .line 71
    .line 72
    iget v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->c:I

    .line 73
    .line 74
    invoke-static {p1, p2, v3}, Landroidx/constraintlayout/motion/widget/r;->c(Landroidx/constraintlayout/motion/widget/r;Landroid/content/Context;I)I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    iput v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->c:I

    .line 79
    .line 80
    goto/16 :goto_1

    .line 81
    .line 82
    :cond_1
    sget v6, Landroidx/constraintlayout/widget/i;->o9:I

    .line 83
    .line 84
    if-ne v5, v6, :cond_3

    .line 85
    .line 86
    iget v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->d:I

    .line 87
    .line 88
    invoke-virtual {p3, v5, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    iput v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->d:I

    .line 93
    .line 94
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    iget v4, p0, Landroidx/constraintlayout/motion/widget/r$b;->d:I

    .line 99
    .line 100
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getResourceTypeName(I)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v4

    .line 108
    if-eqz v4, :cond_2

    .line 109
    .line 110
    new-instance v3, Landroidx/constraintlayout/widget/d;

    .line 111
    .line 112
    invoke-direct {v3}, Landroidx/constraintlayout/widget/d;-><init>()V

    .line 113
    .line 114
    .line 115
    iget v4, p0, Landroidx/constraintlayout/motion/widget/r$b;->d:I

    .line 116
    .line 117
    invoke-virtual {v3, p2, v4}, Landroidx/constraintlayout/widget/d;->x(Landroid/content/Context;I)V

    .line 118
    .line 119
    .line 120
    invoke-static {p1}, Landroidx/constraintlayout/motion/widget/r;->b(Landroidx/constraintlayout/motion/widget/r;)Landroid/util/SparseArray;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    iget v5, p0, Landroidx/constraintlayout/motion/widget/r$b;->d:I

    .line 125
    .line 126
    invoke-virtual {v4, v5, v3}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    goto/16 :goto_1

    .line 130
    .line 131
    :cond_2
    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    if-eqz v3, :cond_f

    .line 136
    .line 137
    iget v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->d:I

    .line 138
    .line 139
    invoke-static {p1, p2, v3}, Landroidx/constraintlayout/motion/widget/r;->c(Landroidx/constraintlayout/motion/widget/r;Landroid/content/Context;I)I

    .line 140
    .line 141
    .line 142
    move-result v3

    .line 143
    iput v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->d:I

    .line 144
    .line 145
    goto/16 :goto_1

    .line 146
    .line 147
    :cond_3
    sget v6, Landroidx/constraintlayout/widget/i;->r9:I

    .line 148
    .line 149
    if-ne v5, v6, :cond_7

    .line 150
    .line 151
    invoke-virtual {p3, v5}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    .line 152
    .line 153
    .line 154
    move-result-object v6

    .line 155
    iget v6, v6, Landroid/util/TypedValue;->type:I

    .line 156
    .line 157
    const/4 v7, -0x2

    .line 158
    if-ne v6, v3, :cond_4

    .line 159
    .line 160
    invoke-virtual {p3, v5, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 161
    .line 162
    .line 163
    move-result v3

    .line 164
    iput v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->g:I

    .line 165
    .line 166
    if-eq v3, v4, :cond_f

    .line 167
    .line 168
    iput v7, p0, Landroidx/constraintlayout/motion/widget/r$b;->e:I

    .line 169
    .line 170
    goto/16 :goto_1

    .line 171
    .line 172
    :cond_4
    const/4 v3, 0x3

    .line 173
    if-ne v6, v3, :cond_6

    .line 174
    .line 175
    invoke-virtual {p3, v5}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    iput-object v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->f:Ljava/lang/String;

    .line 180
    .line 181
    if-eqz v3, :cond_f

    .line 182
    .line 183
    const-string v6, "/"

    .line 184
    .line 185
    invoke-virtual {v3, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 186
    .line 187
    .line 188
    move-result v3

    .line 189
    if-lez v3, :cond_5

    .line 190
    .line 191
    invoke-virtual {p3, v5, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 192
    .line 193
    .line 194
    move-result v3

    .line 195
    iput v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->g:I

    .line 196
    .line 197
    iput v7, p0, Landroidx/constraintlayout/motion/widget/r$b;->e:I

    .line 198
    .line 199
    goto/16 :goto_1

    .line 200
    .line 201
    :cond_5
    iput v4, p0, Landroidx/constraintlayout/motion/widget/r$b;->e:I

    .line 202
    .line 203
    goto/16 :goto_1

    .line 204
    .line 205
    :cond_6
    iget v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->e:I

    .line 206
    .line 207
    invoke-virtual {p3, v5, v3}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 208
    .line 209
    .line 210
    move-result v3

    .line 211
    iput v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->e:I

    .line 212
    .line 213
    goto/16 :goto_1

    .line 214
    .line 215
    :cond_7
    sget v3, Landroidx/constraintlayout/widget/i;->p9:I

    .line 216
    .line 217
    if-ne v5, v3, :cond_8

    .line 218
    .line 219
    iget v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->h:I

    .line 220
    .line 221
    invoke-virtual {p3, v5, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 222
    .line 223
    .line 224
    move-result v3

    .line 225
    iput v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->h:I

    .line 226
    .line 227
    const/16 v4, 0x8

    .line 228
    .line 229
    if-ge v3, v4, :cond_f

    .line 230
    .line 231
    iput v4, p0, Landroidx/constraintlayout/motion/widget/r$b;->h:I

    .line 232
    .line 233
    goto :goto_1

    .line 234
    :cond_8
    sget v3, Landroidx/constraintlayout/widget/i;->t9:I

    .line 235
    .line 236
    if-ne v5, v3, :cond_9

    .line 237
    .line 238
    iget v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->i:F

    .line 239
    .line 240
    invoke-virtual {p3, v5, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 241
    .line 242
    .line 243
    move-result v3

    .line 244
    iput v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->i:F

    .line 245
    .line 246
    goto :goto_1

    .line 247
    :cond_9
    sget v3, Landroidx/constraintlayout/widget/i;->m9:I

    .line 248
    .line 249
    if-ne v5, v3, :cond_a

    .line 250
    .line 251
    iget v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->n:I

    .line 252
    .line 253
    invoke-virtual {p3, v5, v3}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 254
    .line 255
    .line 256
    move-result v3

    .line 257
    iput v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->n:I

    .line 258
    .line 259
    goto :goto_1

    .line 260
    :cond_a
    sget v3, Landroidx/constraintlayout/widget/i;->l9:I

    .line 261
    .line 262
    if-ne v5, v3, :cond_b

    .line 263
    .line 264
    iget v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->a:I

    .line 265
    .line 266
    invoke-virtual {p3, v5, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 267
    .line 268
    .line 269
    move-result v3

    .line 270
    iput v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->a:I

    .line 271
    .line 272
    goto :goto_1

    .line 273
    :cond_b
    sget v3, Landroidx/constraintlayout/widget/i;->u9:I

    .line 274
    .line 275
    if-ne v5, v3, :cond_c

    .line 276
    .line 277
    iget-boolean v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->o:Z

    .line 278
    .line 279
    invoke-virtual {p3, v5, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 280
    .line 281
    .line 282
    move-result v3

    .line 283
    iput-boolean v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->o:Z

    .line 284
    .line 285
    goto :goto_1

    .line 286
    :cond_c
    sget v3, Landroidx/constraintlayout/widget/i;->s9:I

    .line 287
    .line 288
    if-ne v5, v3, :cond_d

    .line 289
    .line 290
    invoke-virtual {p3, v5, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 291
    .line 292
    .line 293
    move-result v3

    .line 294
    iput v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->p:I

    .line 295
    .line 296
    goto :goto_1

    .line 297
    :cond_d
    sget v3, Landroidx/constraintlayout/widget/i;->q9:I

    .line 298
    .line 299
    if-ne v5, v3, :cond_e

    .line 300
    .line 301
    invoke-virtual {p3, v5, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 302
    .line 303
    .line 304
    move-result v3

    .line 305
    iput v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->q:I

    .line 306
    .line 307
    goto :goto_1

    .line 308
    :cond_e
    sget v3, Landroidx/constraintlayout/widget/i;->v9:I

    .line 309
    .line 310
    if-ne v5, v3, :cond_f

    .line 311
    .line 312
    invoke-virtual {p3, v5, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 313
    .line 314
    .line 315
    move-result v3

    .line 316
    iput v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->r:I

    .line 317
    .line 318
    :cond_f
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 319
    .line 320
    goto/16 :goto_0

    .line 321
    .line 322
    :cond_10
    iget p1, p0, Landroidx/constraintlayout/motion/widget/r$b;->d:I

    .line 323
    .line 324
    if-ne p1, v4, :cond_11

    .line 325
    .line 326
    iput-boolean v3, p0, Landroidx/constraintlayout/motion/widget/r$b;->b:Z

    .line 327
    .line 328
    :cond_11
    return-void
.end method

.method private u(Landroidx/constraintlayout/motion/widget/r;Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    sget-object v0, Landroidx/constraintlayout/widget/i;->k9:[I

    .line 2
    .line 3
    invoke-virtual {p2, p3, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/motion/widget/r$b;->t(Landroidx/constraintlayout/motion/widget/r;Landroid/content/Context;Landroid/content/res/TypedArray;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p3}, Landroid/content/res/TypedArray;->recycle()V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public A()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/constraintlayout/motion/widget/r$b;->o:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    return p0
.end method

.method public B(I)Z
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/r$b;->r:I

    .line 2
    .line 3
    and-int/2addr p0, p1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public C(I)V
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput p1, p0, Landroidx/constraintlayout/motion/widget/r$b;->h:I

    .line 8
    .line 9
    return-void
.end method

.method public D(ILjava/lang/String;I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/motion/widget/r$b;->e:I

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/constraintlayout/motion/widget/r$b;->f:Ljava/lang/String;

    .line 4
    .line 5
    iput p3, p0, Landroidx/constraintlayout/motion/widget/r$b;->g:I

    .line 6
    .line 7
    return-void
.end method

.method public E(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/motion/widget/r$b;->p:I

    .line 2
    .line 3
    return-void
.end method

.method public r(Landroidx/constraintlayout/motion/widget/g;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/r$b;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/r$b;->m:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v1, Landroidx/constraintlayout/motion/widget/r$b$a;

    .line 4
    .line 5
    invoke-direct {v1, p1, p0, p2}, Landroidx/constraintlayout/motion/widget/r$b$a;-><init>(Landroid/content/Context;Landroidx/constraintlayout/motion/widget/r$b;Lorg/xmlpull/v1/XmlPullParser;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public v()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/r$b;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public w()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/r$b;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public x()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/r$b;->q:I

    .line 2
    .line 3
    return p0
.end method

.method public y()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/r$b;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public z()Landroidx/constraintlayout/motion/widget/s;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/r$b;->l:Landroidx/constraintlayout/motion/widget/s;

    .line 2
    .line 3
    return-object p0
.end method
