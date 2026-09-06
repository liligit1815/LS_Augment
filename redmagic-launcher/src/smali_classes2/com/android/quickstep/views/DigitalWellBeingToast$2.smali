.class public final Lcom/android/quickstep/views/DigitalWellBeingToast$2;
.super Landroid/view/ViewOutlineProvider;
.source "DigitalWellBeingToast.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/DigitalWellBeingToast;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/views/DigitalWellBeingToast;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/DigitalWellBeingToast;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/DigitalWellBeingToast$2;->this$0:Lcom/android/quickstep/views/DigitalWellBeingToast;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 1

    .line 1
    const-string v0, "view"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "outline"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object v0, Landroid/view/ViewOutlineProvider;->BACKGROUND:Landroid/view/ViewOutlineProvider;

    .line 12
    .line 13
    invoke-virtual {v0, p1, p2}, Landroid/view/ViewOutlineProvider;->getOutline(Landroid/view/View;Landroid/graphics/Outline;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/quickstep/views/DigitalWellBeingToast$2;->this$0:Lcom/android/quickstep/views/DigitalWellBeingToast;

    .line 17
    .line 18
    invoke-static {p1}, Lcom/android/quickstep/views/DigitalWellBeingToast;->access$getSplitOffsetTranslationY$p(Lcom/android/quickstep/views/DigitalWellBeingToast;)F

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iget-object p0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast$2;->this$0:Lcom/android/quickstep/views/DigitalWellBeingToast;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/widget/TextView;->getTranslationY()F

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    sub-float/2addr p1, p0

    .line 29
    const/4 p0, 0x0

    .line 30
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    invoke-virtual {p2, p0, p1}, Landroid/graphics/Outline;->offset(II)V

    .line 35
    .line 36
    .line 37
    return-void
.end method
