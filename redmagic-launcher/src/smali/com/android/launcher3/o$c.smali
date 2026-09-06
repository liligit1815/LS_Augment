.class final Lcom/android/launcher3/o$c;
.super Ljava/lang/Object;
.source "AutoAlignHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/o;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "c"
.end annotation


# instance fields
.field private a:Lcom/android/launcher3/G5;

.field private b:Landroid/view/View;

.field private c:Landroid/graphics/Point;

.field private d:Landroid/graphics/Point;

.field private e:Landroid/graphics/Point;

.field private f:Landroid/graphics/Point;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/q;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/o$c;-><init>()V

    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/o$c;)Landroid/graphics/Point;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/o$c;->d:Landroid/graphics/Point;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/o$c;)Landroid/graphics/Point;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/o$c;->f:Landroid/graphics/Point;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/o$c;)Lcom/android/launcher3/G5;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/o$c;->a:Lcom/android/launcher3/G5;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/o$c;)Landroid/graphics/Point;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/o$c;->e:Landroid/graphics/Point;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/o$c;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/o$c;->b:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic f(Lcom/android/launcher3/o$c;Landroid/graphics/Point;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/o$c;->d:Landroid/graphics/Point;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic g(Lcom/android/launcher3/o$c;Landroid/graphics/Point;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/o$c;->f:Landroid/graphics/Point;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic h(Lcom/android/launcher3/o$c;Lcom/android/launcher3/G5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/o$c;->a:Lcom/android/launcher3/G5;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic i(Lcom/android/launcher3/o$c;Landroid/graphics/Point;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/o$c;->c:Landroid/graphics/Point;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic j(Lcom/android/launcher3/o$c;Landroid/graphics/Point;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/o$c;->e:Landroid/graphics/Point;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic k(Lcom/android/launcher3/o$c;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/o$c;->b:Landroid/view/View;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic l(Lcom/android/launcher3/K5;Landroid/view/View;)Landroid/graphics/Point;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/o$c;->m(Lcom/android/launcher3/K5;Landroid/view/View;)Landroid/graphics/Point;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static m(Lcom/android/launcher3/K5;Landroid/view/View;)Landroid/graphics/Point;
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lc1/b;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/K5;->setupLp(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lc1/b;

    .line 17
    .line 18
    new-instance p1, Landroid/graphics/Point;

    .line 19
    .line 20
    iget v0, p0, Lc1/b;->j:I

    .line 21
    .line 22
    iget p0, p0, Lc1/b;->k:I

    .line 23
    .line 24
    invoke-direct {p1, v0, p0}, Landroid/graphics/Point;-><init>(II)V

    .line 25
    .line 26
    .line 27
    return-object p1

    .line 28
    :cond_0
    new-instance p0, Landroid/graphics/Point;

    .line 29
    .line 30
    invoke-direct {p0}, Landroid/graphics/Point;-><init>()V

    .line 31
    .line 32
    .line 33
    return-object p0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "AnimData{startCell="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/o$c;->c:Landroid/graphics/Point;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", endCell="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/o$c;->d:Landroid/graphics/Point;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, ", startOffset="

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/launcher3/o$c;->e:Landroid/graphics/Point;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v1, ", endOffset="

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lcom/android/launcher3/o$c;->f:Landroid/graphics/Point;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v1, ", tag= "

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/android/launcher3/o$c;->b:Landroid/view/View;

    .line 52
    .line 53
    if-eqz p0, :cond_0

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    goto :goto_0

    .line 60
    :cond_0
    const/4 p0, 0x0

    .line 61
    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string p0, "}"

    .line 65
    .line 66
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0
.end method
