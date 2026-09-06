.class Lcom/android/launcher3/keyboard/a$c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ItemFocusIndicatorHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/keyboard/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "c"
.end annotation


# instance fields
.field private final g:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final h:Z

.field private i:Z

.field final synthetic j:Lcom/android/launcher3/keyboard/a;


# direct methods
.method constructor <init>(Lcom/android/launcher3/keyboard/a;Ljava/lang/Object;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;Z)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/keyboard/a$c;->j:Lcom/android/launcher3/keyboard/a;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lcom/android/launcher3/keyboard/a$c;->i:Z

    .line 8
    .line 9
    iput-object p2, p0, Lcom/android/launcher3/keyboard/a$c;->g:Ljava/lang/Object;

    .line 10
    .line 11
    iput-boolean p3, p0, Lcom/android/launcher3/keyboard/a$c;->h:Z

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/android/launcher3/keyboard/a$c;->h:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    iput-boolean p1, p0, Lcom/android/launcher3/keyboard/a$c;->i:Z

    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Lcom/android/launcher3/keyboard/a$c;->i:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/launcher3/keyboard/a$c;->j:Lcom/android/launcher3/keyboard/a;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/keyboard/a$c;->g:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Lcom/android/launcher3/keyboard/a;->k(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    iput-boolean p1, p0, Lcom/android/launcher3/keyboard/a$c;->i:Z

    .line 14
    .line 15
    :cond_0
    return-void
.end method
