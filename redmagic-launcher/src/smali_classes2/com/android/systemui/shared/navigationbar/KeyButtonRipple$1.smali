.class Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "KeyButtonRipple.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;


# direct methods
.method constructor <init>(Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$1;->this$0:Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$1;->this$0:Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->d(Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;)Ljava/util/HashSet;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$1;->this$0:Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->d(Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;)Ljava/util/HashSet;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Ljava/util/HashSet;->isEmpty()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$1;->this$0:Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;

    .line 23
    .line 24
    invoke-static {p1}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->c(Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    iget-object p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$1;->this$0:Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    invoke-static {p1, v0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->f(Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;Z)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$1;->this$0:Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;

    .line 37
    .line 38
    invoke-static {p1, v0}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->e(Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;Z)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple$1;->this$0:Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method
