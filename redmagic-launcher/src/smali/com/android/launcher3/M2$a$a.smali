.class Lcom/android/launcher3/M2$a$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "LauncherAnimationRunner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/M2$a;->u2(Landroid/animation/AnimatorSet;Landroid/content/Context;Ljava/lang/Runnable;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/M2$a;


# direct methods
.method constructor <init>(Lcom/android/launcher3/M2$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/M2$a$a;->g:Lcom/android/launcher3/M2$a;

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
    sget-object p1, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 2
    .line 3
    const-string v0, "Launcher.localAnimationEnd"

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/K2;->beginSection(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/M2$a$a;->g:Lcom/android/launcher3/M2$a;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/android/launcher3/M2$a;->p2(Lcom/android/launcher3/M2$a;)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/util/K2;->endSection()V

    .line 16
    .line 17
    .line 18
    return-void
.end method
