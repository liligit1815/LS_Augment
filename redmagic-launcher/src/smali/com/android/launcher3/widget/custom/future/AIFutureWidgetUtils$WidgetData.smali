.class public Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;
.super Ljava/lang/Object;
.source "AIFutureWidgetUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "WidgetData"
.end annotation

.annotation build Le/a;
.end annotation


# instance fields
.field public final cls:Ljava/lang/String;

.field private final heightDp:I

.field private final marginBottomDp:I

.field private final marginTopDp:I

.field public final pkg:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;III)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;->pkg:Ljava/lang/String;

    .line 4
    iput-object p2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;->cls:Ljava/lang/String;

    .line 5
    iput p3, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;->heightDp:I

    .line 6
    iput p4, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;->marginTopDp:I

    .line 7
    iput p5, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;->marginBottomDp:I

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;IIILcom/android/launcher3/widget/custom/future/g;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;-><init>(Ljava/lang/String;Ljava/lang/String;III)V

    return-void
.end method


# virtual methods
.method protected getHeightPx(I)I
    .locals 1

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;->heightDp:I

    .line 4
    .line 5
    if-lez p0, :cond_0

    .line 6
    .line 7
    const/high16 v0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    int-to-float p0, p0

    .line 10
    mul-float/2addr p0, v0

    .line 11
    const v0, 0x444ec000    # 827.0f

    .line 12
    .line 13
    .line 14
    div-float/2addr p0, v0

    .line 15
    int-to-float p1, p1

    .line 16
    mul-float/2addr p0, p1

    .line 17
    float-to-int p0, p0

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method protected getMarginTopBottomPx(I)Landroid/graphics/Point;
    .locals 3

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    iget v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;->marginTopDp:I

    .line 4
    .line 5
    int-to-float v0, v0

    .line 6
    const/high16 v1, 0x3f800000    # 1.0f

    .line 7
    .line 8
    mul-float/2addr v0, v1

    .line 9
    const v2, 0x444ec000    # 827.0f

    .line 10
    .line 11
    .line 12
    div-float/2addr v0, v2

    .line 13
    int-to-float p1, p1

    .line 14
    mul-float/2addr v0, p1

    .line 15
    float-to-int v0, v0

    .line 16
    iget p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;->marginBottomDp:I

    .line 17
    .line 18
    int-to-float p0, p0

    .line 19
    mul-float/2addr p0, v1

    .line 20
    div-float/2addr p0, v2

    .line 21
    mul-float/2addr p0, p1

    .line 22
    float-to-int p0, p0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v0, 0x0

    .line 25
    move p0, v0

    .line 26
    :goto_0
    new-instance p1, Landroid/graphics/Point;

    .line 27
    .line 28
    invoke-direct {p1, v0, p0}, Landroid/graphics/Point;-><init>(II)V

    .line 29
    .line 30
    .line 31
    return-object p1
.end method
