.class public Lcom/android/quickstep/FullscreenDrawParams;
.super Ljava/lang/Object;
.source "FullscreenDrawParams.kt"

# interfaces
.implements Lcom/android/launcher3/util/a2;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/FullscreenDrawParams$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/FullscreenDrawParams$Companion;


# instance fields
.field private currentCornerRadius:F

.field private mCurrentDrawnInsets:Landroid/graphics/RectF;

.field private mFullscreenProgress:F

.field private mScale:F

.field private taskCornerRadius:F

.field private final taskCornerRadiusProvider:Lu4/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/l<",
            "Landroid/content/Context;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private windowCornerRadius:F

.field private final windowCornerRadiusProvider:Lu4/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/l<",
            "Landroid/content/Context;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/FullscreenDrawParams$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/FullscreenDrawParams$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/FullscreenDrawParams;->Companion:Lcom/android/quickstep/FullscreenDrawParams$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 7

    .line 1
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x6

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v1 .. v6}, Lcom/android/quickstep/FullscreenDrawParams;-><init>(Landroid/content/Context;Lu4/l;Lu4/l;ILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lu4/l;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lu4/l<",
            "-",
            "Landroid/content/Context;",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 2
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "taskCornerRadiusProvider"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x4

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v1 .. v6}, Lcom/android/quickstep/FullscreenDrawParams;-><init>(Landroid/content/Context;Lu4/l;Lu4/l;ILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lu4/l;Lu4/l;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lu4/l<",
            "-",
            "Landroid/content/Context;",
            "Ljava/lang/Float;",
            ">;",
            "Lu4/l<",
            "-",
            "Landroid/content/Context;",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "taskCornerRadiusProvider"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "windowCornerRadiusProvider"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    iput-object p2, p0, Lcom/android/quickstep/FullscreenDrawParams;->taskCornerRadiusProvider:Lu4/l;

    .line 5
    iput-object p3, p0, Lcom/android/quickstep/FullscreenDrawParams;->windowCornerRadiusProvider:Lu4/l;

    .line 6
    new-instance p2, Landroid/graphics/RectF;

    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    iput-object p2, p0, Lcom/android/quickstep/FullscreenDrawParams;->mCurrentDrawnInsets:Landroid/graphics/RectF;

    const/high16 p2, 0x3f800000    # 1.0f

    .line 7
    iput p2, p0, Lcom/android/quickstep/FullscreenDrawParams;->mScale:F

    .line 8
    invoke-virtual {p0, p1}, Lcom/android/quickstep/FullscreenDrawParams;->updateCornerRadius(Landroid/content/Context;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Lu4/l;Lu4/l;ILkotlin/jvm/internal/j;)V
    .locals 0

    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_0

    .line 9
    new-instance p2, Lcom/android/quickstep/FullscreenDrawParams$1;

    sget-object p5, Lcom/android/quickstep/FullscreenDrawParams;->Companion:Lcom/android/quickstep/FullscreenDrawParams$Companion;

    invoke-direct {p2, p5}, Lcom/android/quickstep/FullscreenDrawParams$1;-><init>(Ljava/lang/Object;)V

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    .line 10
    new-instance p3, Lcom/android/quickstep/FullscreenDrawParams$2;

    sget-object p4, Lcom/android/quickstep/FullscreenDrawParams;->Companion:Lcom/android/quickstep/FullscreenDrawParams$Companion;

    invoke-direct {p3, p4}, Lcom/android/quickstep/FullscreenDrawParams$2;-><init>(Ljava/lang/Object;)V

    .line 11
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/FullscreenDrawParams;-><init>(Landroid/content/Context;Lu4/l;Lu4/l;)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 0

    .line 1
    return-void
.end method

.method public final getCurrentCornerRadius()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/FullscreenDrawParams;->currentCornerRadius:F

    .line 2
    .line 3
    return p0
.end method

.method public final getMCurrentDrawnInsets()Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/FullscreenDrawParams;->mCurrentDrawnInsets:Landroid/graphics/RectF;

    .line 2
    .line 3
    return-object p0
.end method

.method protected final getMFullscreenProgress()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/FullscreenDrawParams;->mFullscreenProgress:F

    .line 2
    .line 3
    return p0
.end method

.method public final getMScale()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/FullscreenDrawParams;->mScale:F

    .line 2
    .line 3
    return p0
.end method

.method public final setCurrentCornerRadius(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/FullscreenDrawParams;->currentCornerRadius:F

    .line 2
    .line 3
    return-void
.end method

.method public final setMCurrentDrawnInsets(Landroid/graphics/RectF;)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/quickstep/FullscreenDrawParams;->mCurrentDrawnInsets:Landroid/graphics/RectF;

    .line 7
    .line 8
    return-void
.end method

.method protected final setMFullscreenProgress(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/FullscreenDrawParams;->mFullscreenProgress:F

    .line 2
    .line 3
    return-void
.end method

.method public final setMScale(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/FullscreenDrawParams;->mScale:F

    .line 2
    .line 3
    return-void
.end method

.method public final setProgress(FFF)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/quickstep/FullscreenDrawParams;->taskCornerRadius:F

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/FullscreenDrawParams;->windowCornerRadius:F

    .line 4
    .line 5
    invoke-static {p1, v0, v1}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    div-float/2addr p1, p2

    .line 10
    div-float/2addr p1, p3

    .line 11
    iput p1, p0, Lcom/android/quickstep/FullscreenDrawParams;->currentCornerRadius:F

    .line 12
    .line 13
    return-void
.end method

.method public final updateCornerRadius(Landroid/content/Context;)V
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/FullscreenDrawParams;->taskCornerRadiusProvider:Lu4/l;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ljava/lang/Number;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Lcom/android/quickstep/FullscreenDrawParams;->taskCornerRadius:F

    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/quickstep/FullscreenDrawParams;->windowCornerRadiusProvider:Lu4/l;

    .line 21
    .line 22
    invoke-interface {v0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Ljava/lang/Number;

    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iput p1, p0, Lcom/android/quickstep/FullscreenDrawParams;->windowCornerRadius:F

    .line 33
    .line 34
    return-void
.end method
