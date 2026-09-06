.class public Lcom/android/launcher3/util/y1;
.super Ljava/lang/Object;
.source "MultiScalePropertyFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/util/y1$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/view/View;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Ljava/lang/Integer;",
            "Lcom/android/launcher3/util/y1<",
            "TT;>.a;>;"
        }
    .end annotation
.end field

.field private c:F

.field private d:F

.field private e:F

.field private f:Ljava/lang/Integer;

.field private g:F


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/util/ArrayMap;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/util/y1;->b:Landroid/util/ArrayMap;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lcom/android/launcher3/util/y1;->c:F

    .line 13
    .line 14
    iput v0, p0, Lcom/android/launcher3/util/y1;->d:F

    .line 15
    .line 16
    iput v0, p0, Lcom/android/launcher3/util/y1;->e:F

    .line 17
    .line 18
    const/4 v0, -0x1

    .line 19
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/android/launcher3/util/y1;->f:Ljava/lang/Integer;

    .line 24
    .line 25
    const/high16 v0, 0x3f800000    # 1.0f

    .line 26
    .line 27
    iput v0, p0, Lcom/android/launcher3/util/y1;->g:F

    .line 28
    .line 29
    iput-object p1, p0, Lcom/android/launcher3/util/y1;->a:Ljava/lang/String;

    .line 30
    .line 31
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/util/y1;Ljava/lang/Integer;Ljava/lang/Integer;)Lcom/android/launcher3/util/y1$a;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/util/y1;->o(Ljava/lang/Integer;Ljava/lang/Integer;)Lcom/android/launcher3/util/y1$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/util/y1;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/y1;->g:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/util/y1;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/y1;->f:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/util/y1;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/y1;->d:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/util/y1;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/y1;->c:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic f(Lcom/android/launcher3/util/y1;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/y1;->e:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic g(Lcom/android/launcher3/util/y1;)Landroid/util/ArrayMap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/y1;->b:Landroid/util/ArrayMap;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic h(Lcom/android/launcher3/util/y1;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/util/y1;->g:F

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic i(Lcom/android/launcher3/util/y1;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/util/y1;->f:Ljava/lang/Integer;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic j(Lcom/android/launcher3/util/y1;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/util/y1;->d:F

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic k(Lcom/android/launcher3/util/y1;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/util/y1;->c:F

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic l(Lcom/android/launcher3/util/y1;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/util/y1;->e:F

    .line 2
    .line 3
    return-void
.end method

.method private synthetic o(Ljava/lang/Integer;Ljava/lang/Integer;)Lcom/android/launcher3/util/y1$a;
    .locals 3

    .line 1
    new-instance p2, Lcom/android/launcher3/util/y1$a;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Lcom/android/launcher3/util/y1;->a:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v2, "_"

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-direct {p2, p0, v0, p1}, Lcom/android/launcher3/util/y1$a;-><init>(Lcom/android/launcher3/util/y1;ILjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-object p2
.end method


# virtual methods
.method protected m(Landroid/view/View;F)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleX(F)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleY(F)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public n(Ljava/lang/Integer;)Landroid/util/FloatProperty;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Integer;",
            ")",
            "Landroid/util/FloatProperty<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/y1;->b:Landroid/util/ArrayMap;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/util/w1;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/util/w1;-><init>(Lcom/android/launcher3/util/y1;Ljava/lang/Integer;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, v1}, Landroid/util/ArrayMap;->computeIfAbsent(Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Landroid/util/FloatProperty;

    .line 13
    .line 14
    return-object p0
.end method
