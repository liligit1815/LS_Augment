.class public Landroidx/constraintlayout/motion/widget/h;
.super Landroidx/constraintlayout/motion/widget/i;
.source "KeyPosition.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/motion/widget/h$a;
    }
.end annotation


# instance fields
.field h:Ljava/lang/String;

.field i:I

.field j:I

.field k:F

.field l:F

.field m:F

.field n:F

.field o:F

.field p:F

.field q:I

.field private r:F

.field private s:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroidx/constraintlayout/motion/widget/i;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/h;->h:Ljava/lang/String;

    .line 6
    .line 7
    sget v0, Landroidx/constraintlayout/motion/widget/d;->f:I

    .line 8
    .line 9
    iput v0, p0, Landroidx/constraintlayout/motion/widget/h;->i:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Landroidx/constraintlayout/motion/widget/h;->j:I

    .line 13
    .line 14
    const/high16 v1, 0x7fc00000    # Float.NaN

    .line 15
    .line 16
    iput v1, p0, Landroidx/constraintlayout/motion/widget/h;->k:F

    .line 17
    .line 18
    iput v1, p0, Landroidx/constraintlayout/motion/widget/h;->l:F

    .line 19
    .line 20
    iput v1, p0, Landroidx/constraintlayout/motion/widget/h;->m:F

    .line 21
    .line 22
    iput v1, p0, Landroidx/constraintlayout/motion/widget/h;->n:F

    .line 23
    .line 24
    iput v1, p0, Landroidx/constraintlayout/motion/widget/h;->o:F

    .line 25
    .line 26
    iput v1, p0, Landroidx/constraintlayout/motion/widget/h;->p:F

    .line 27
    .line 28
    iput v0, p0, Landroidx/constraintlayout/motion/widget/h;->q:I

    .line 29
    .line 30
    iput v1, p0, Landroidx/constraintlayout/motion/widget/h;->r:F

    .line 31
    .line 32
    iput v1, p0, Landroidx/constraintlayout/motion/widget/h;->s:F

    .line 33
    .line 34
    const/4 v0, 0x2

    .line 35
    iput v0, p0, Landroidx/constraintlayout/motion/widget/d;->d:I

    .line 36
    .line 37
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
    new-instance v0, Landroidx/constraintlayout/motion/widget/h;

    .line 2
    .line 3
    invoke-direct {v0}, Landroidx/constraintlayout/motion/widget/h;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Landroidx/constraintlayout/motion/widget/h;->c(Landroidx/constraintlayout/motion/widget/d;)Landroidx/constraintlayout/motion/widget/d;

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
    check-cast p1, Landroidx/constraintlayout/motion/widget/h;

    .line 5
    .line 6
    iget-object v0, p1, Landroidx/constraintlayout/motion/widget/h;->h:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/h;->h:Ljava/lang/String;

    .line 9
    .line 10
    iget v0, p1, Landroidx/constraintlayout/motion/widget/h;->i:I

    .line 11
    .line 12
    iput v0, p0, Landroidx/constraintlayout/motion/widget/h;->i:I

    .line 13
    .line 14
    iget v0, p1, Landroidx/constraintlayout/motion/widget/h;->j:I

    .line 15
    .line 16
    iput v0, p0, Landroidx/constraintlayout/motion/widget/h;->j:I

    .line 17
    .line 18
    iget v0, p1, Landroidx/constraintlayout/motion/widget/h;->k:F

    .line 19
    .line 20
    iput v0, p0, Landroidx/constraintlayout/motion/widget/h;->k:F

    .line 21
    .line 22
    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 23
    .line 24
    iput v0, p0, Landroidx/constraintlayout/motion/widget/h;->l:F

    .line 25
    .line 26
    iget v0, p1, Landroidx/constraintlayout/motion/widget/h;->m:F

    .line 27
    .line 28
    iput v0, p0, Landroidx/constraintlayout/motion/widget/h;->m:F

    .line 29
    .line 30
    iget v0, p1, Landroidx/constraintlayout/motion/widget/h;->n:F

    .line 31
    .line 32
    iput v0, p0, Landroidx/constraintlayout/motion/widget/h;->n:F

    .line 33
    .line 34
    iget v0, p1, Landroidx/constraintlayout/motion/widget/h;->o:F

    .line 35
    .line 36
    iput v0, p0, Landroidx/constraintlayout/motion/widget/h;->o:F

    .line 37
    .line 38
    iget v0, p1, Landroidx/constraintlayout/motion/widget/h;->p:F

    .line 39
    .line 40
    iput v0, p0, Landroidx/constraintlayout/motion/widget/h;->p:F

    .line 41
    .line 42
    iget v0, p1, Landroidx/constraintlayout/motion/widget/h;->r:F

    .line 43
    .line 44
    iput v0, p0, Landroidx/constraintlayout/motion/widget/h;->r:F

    .line 45
    .line 46
    iget p1, p1, Landroidx/constraintlayout/motion/widget/h;->s:F

    .line 47
    .line 48
    iput p1, p0, Landroidx/constraintlayout/motion/widget/h;->s:F

    .line 49
    .line 50
    return-object p0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/h;->b()Landroidx/constraintlayout/motion/widget/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public e(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    sget-object v0, Landroidx/constraintlayout/widget/i;->L5:[I

    .line 2
    .line 3
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p0, p1}, Landroidx/constraintlayout/motion/widget/h$a;->a(Landroidx/constraintlayout/motion/widget/h;Landroid/content/res/TypedArray;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
