.class public Ln1/s;
.super Ljava/lang/Object;
.source "Scrim.java"


# static fields
.field public static final f:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Ln1/s;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected final a:Landroid/view/View;

.field protected b:F

.field protected c:I

.field protected d:I

.field private e:Lcom/android/launcher3/C2;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ln1/s$a;

    .line 2
    .line 3
    const-string v1, "scrimProgress"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ln1/s$a;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Ln1/s;->f:Landroid/util/FloatProperty;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ln1/s;->d:I

    .line 6
    .line 7
    iput-object p1, p0, Ln1/s;->a:Landroid/view/View;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Ln1/s;->b(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ln1/s;->e:Lcom/android/launcher3/C2;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getForeColor()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-static {p1}, Lx1/O;->G0(I)I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iput p1, p0, Ln1/s;->c:I

    .line 23
    .line 24
    return-void
.end method

.method private b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Ln1/s;->e:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ln1/s;->e:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lx1/O;->t()Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    invoke-virtual {p1, p0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget v0, p0, Ln1/s;->c:I

    .line 22
    .line 23
    iget p0, p0, Ln1/s;->d:I

    .line 24
    .line 25
    invoke-static {v0, p0}, Ls1/q;->h(II)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-virtual {p1, p0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public c(F)V
    .locals 1

    .line 1
    iget v0, p0, Ln1/s;->b:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Ln1/s;->b:F

    .line 8
    .line 9
    const/high16 v0, 0x437f0000    # 255.0f

    .line 10
    .line 11
    mul-float/2addr p1, v0

    .line 12
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput p1, p0, Ln1/s;->d:I

    .line 17
    .line 18
    iget-object p0, p0, Ln1/s;->a:Landroid/view/View;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
