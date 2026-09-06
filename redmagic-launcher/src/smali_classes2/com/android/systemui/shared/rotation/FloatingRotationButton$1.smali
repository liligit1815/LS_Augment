.class Lcom/android/systemui/shared/rotation/FloatingRotationButton$1;
.super Landroid/graphics/drawable/Animatable2$AnimationCallback;
.source "FloatingRotationButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/shared/rotation/FloatingRotationButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/shared/rotation/FloatingRotationButton;


# direct methods
.method constructor <init>(Lcom/android/systemui/shared/rotation/FloatingRotationButton;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/systemui/shared/rotation/FloatingRotationButton$1;->this$0:Lcom/android/systemui/shared/rotation/FloatingRotationButton;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/graphics/drawable/Animatable2$AnimationCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/android/systemui/shared/rotation/FloatingRotationButton$1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/systemui/shared/rotation/FloatingRotationButton$1;->lambda$onAnimationEnd$0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onAnimationEnd$0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/systemui/shared/rotation/FloatingRotationButton$1;->this$0:Lcom/android/systemui/shared/rotation/FloatingRotationButton;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/systemui/shared/rotation/FloatingRotationButton;->e(Lcom/android/systemui/shared/rotation/FloatingRotationButton;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/graphics/drawable/Drawable;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/android/systemui/shared/rotation/FloatingRotationButton$1;->this$0:Lcom/android/systemui/shared/rotation/FloatingRotationButton;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/systemui/shared/rotation/FloatingRotationButton;->d(Lcom/android/systemui/shared/rotation/FloatingRotationButton;)Lcom/android/systemui/shared/rotation/FloatingRotationButtonView;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/systemui/shared/rotation/FloatingRotationButton$1;->this$0:Lcom/android/systemui/shared/rotation/FloatingRotationButton;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/android/systemui/shared/rotation/FloatingRotationButton;->d(Lcom/android/systemui/shared/rotation/FloatingRotationButton;)Lcom/android/systemui/shared/rotation/FloatingRotationButtonView;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v0, Lcom/android/systemui/shared/rotation/d;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Lcom/android/systemui/shared/rotation/d;-><init>(Lcom/android/systemui/shared/rotation/FloatingRotationButton$1;)V

    .line 18
    .line 19
    .line 20
    const-wide/16 v1, 0x1f4

    .line 21
    .line 22
    invoke-virtual {p1, v0, v1, v2}, Landroid/widget/ImageView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method
