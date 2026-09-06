.class Lcom/android/launcher3/dragndrop/v$d;
.super Ljava/lang/Object;
.source "DragView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/dragndrop/v;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "d"
.end annotation


# static fields
.field private static final e:Landroidx/dynamicanimation/animation/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/dynamicanimation/animation/g<",
            "Lcom/android/launcher3/dragndrop/v$d;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final a:Landroid/view/View;

.field private final b:Landroidx/dynamicanimation/animation/j;

.field private final c:F

.field private d:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/dragndrop/v$d$a;

    .line 2
    .line 3
    const-string v1, "value"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/launcher3/dragndrop/v$d$a;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/launcher3/dragndrop/v$d;->e:Landroidx/dynamicanimation/animation/g;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/view/View;F)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/v$d;->a:Landroid/view/View;

    .line 5
    .line 6
    new-instance v0, Landroidx/dynamicanimation/animation/j;

    .line 7
    .line 8
    sget-object v1, Lcom/android/launcher3/dragndrop/v$d;->e:Landroidx/dynamicanimation/animation/g;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-direct {v0, p0, v1, v2}, Landroidx/dynamicanimation/animation/j;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;F)V

    .line 12
    .line 13
    .line 14
    neg-float v1, p2

    .line 15
    invoke-virtual {v0, v1}, Landroidx/dynamicanimation/animation/e;->n(F)Landroidx/dynamicanimation/animation/e;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroidx/dynamicanimation/animation/j;

    .line 20
    .line 21
    invoke-virtual {v0, p2}, Landroidx/dynamicanimation/animation/e;->m(F)Landroidx/dynamicanimation/animation/e;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Landroidx/dynamicanimation/animation/j;

    .line 26
    .line 27
    new-instance v1, Landroidx/dynamicanimation/animation/k;

    .line 28
    .line 29
    invoke-direct {v1, v2}, Landroidx/dynamicanimation/animation/k;-><init>(F)V

    .line 30
    .line 31
    .line 32
    const/high16 v2, 0x3f800000    # 1.0f

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Landroidx/dynamicanimation/animation/k;->f(F)Landroidx/dynamicanimation/animation/k;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const/high16 v2, 0x457a0000    # 4000.0f

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Landroidx/dynamicanimation/animation/k;->h(F)Landroidx/dynamicanimation/animation/k;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Landroidx/dynamicanimation/animation/j;->B(Landroidx/dynamicanimation/animation/k;)Landroidx/dynamicanimation/animation/j;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/v$d;->b:Landroidx/dynamicanimation/animation/j;

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    .line 59
    .line 60
    const/high16 v0, 0x41000000    # 8.0f

    .line 61
    .line 62
    mul-float/2addr p1, v0

    .line 63
    invoke-static {p2, p1}, Ljava/lang/Math;->min(FF)F

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    iput p1, p0, Lcom/android/launcher3/dragndrop/v$d;->c:F

    .line 68
    .line 69
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/dragndrop/v$d;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/dragndrop/v$d;->d:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/dragndrop/v$d;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/v$d;->a:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/dragndrop/v$d;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/dragndrop/v$d;->d:F

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public d(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/v$d;->b:Landroidx/dynamicanimation/animation/j;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/dragndrop/v$d;->c:F

    .line 4
    .line 5
    neg-float v1, p0

    .line 6
    invoke-static {p1, v1, p0}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-virtual {v0, p0}, Landroidx/dynamicanimation/animation/j;->w(F)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
