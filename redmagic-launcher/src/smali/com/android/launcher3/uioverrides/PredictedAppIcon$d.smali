.class Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;
.super Ljava/lang/Object;
.source "PredictedAppIcon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/uioverrides/PredictedAppIcon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "d"
.end annotation


# instance fields
.field public final a:Lcom/android/launcher3/anim/d;

.field public final b:Landroid/animation/ArgbEvaluator;

.field public c:Ljava/lang/Integer;

.field public d:Ljava/lang/Integer;

.field public e:I

.field final synthetic f:Lcom/android/launcher3/uioverrides/PredictedAppIcon;


# direct methods
.method private constructor <init>(Lcom/android/launcher3/uioverrides/PredictedAppIcon;)V
    .locals 2

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->f:Lcom/android/launcher3/uioverrides/PredictedAppIcon;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    new-instance p1, Lcom/android/launcher3/anim/d;

    new-instance v0, Lcom/android/launcher3/uioverrides/c;

    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/c;-><init>(Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;)V

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {p1, v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;F)V

    iput-object p1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->a:Lcom/android/launcher3/anim/d;

    .line 4
    invoke-static {}, Landroid/animation/ArgbEvaluator;->getInstance()Landroid/animation/ArgbEvaluator;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->b:Landroid/animation/ArgbEvaluator;

    const/4 p1, 0x0

    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->c:Ljava/lang/Integer;

    .line 6
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->d:Ljava/lang/Integer;

    .line 7
    iput p1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->e:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/uioverrides/PredictedAppIcon;Lcom/android/launcher3/uioverrides/d;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;-><init>(Lcom/android/launcher3/uioverrides/PredictedAppIcon;)V

    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic b(Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private c()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->b:Landroid/animation/ArgbEvaluator;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->a:Lcom/android/launcher3/anim/d;

    .line 4
    .line 5
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 6
    .line 7
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->c:Ljava/lang/Integer;

    .line 8
    .line 9
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->d:Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, v3}, Landroid/animation/ArgbEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->e:I

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->f:Lcom/android/launcher3/uioverrides/PredictedAppIcon;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/widget/TextView;->invalidate()V

    .line 26
    .line 27
    .line 28
    return-void
.end method
