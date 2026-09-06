.class Lcom/android/launcher3/C2$f$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "Launcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/C2$f;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/content/Context;

.field final synthetic h:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/android/launcher3/C2$f;Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/C2$f$a;->g:Landroid/content/Context;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/android/launcher3/C2$f$a;->h:Ljava/util/ArrayList;

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
    iget-object p1, p0, Lcom/android/launcher3/C2$f$a;->g:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object v0, p0, Lcom/android/launcher3/C2$f$a;->g:Landroid/content/Context;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object p0, p0, Lcom/android/launcher3/C2$f$a;->h:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {p1, v0, p0}, Lcom/android/launcher3/Workspace;->E2(Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
