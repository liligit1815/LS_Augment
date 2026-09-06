.class Lcom/android/launcher3/statemanager/d$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "StateManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/statemanager/d;->t(I[F)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:I

.field final synthetic h:Lcom/android/launcher3/statemanager/d;


# direct methods
.method constructor <init>(Lcom/android/launcher3/statemanager/d;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/statemanager/d$b;->h:Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/statemanager/d$b;->g:I

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/statemanager/d$b;->h:Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/statemanager/d;->d(Lcom/android/launcher3/statemanager/d;)Lcom/android/launcher3/statemanager/d$d;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/android/launcher3/statemanager/d$d;->a(Lcom/android/launcher3/statemanager/d$d;)[Landroid/animation/Animator;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget p0, p0, Lcom/android/launcher3/statemanager/d$b;->g:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    aput-object v0, p1, p0

    .line 15
    .line 16
    return-void
.end method
