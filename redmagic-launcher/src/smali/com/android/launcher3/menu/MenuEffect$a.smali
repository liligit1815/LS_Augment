.class Lcom/android/launcher3/menu/MenuEffect$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "MenuEffect.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/menu/MenuEffect;->i(Lcom/android/launcher3/menu/k;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/menu/k;

.field final synthetic h:Lcom/android/launcher3/menu/MenuEffect;


# direct methods
.method constructor <init>(Lcom/android/launcher3/menu/MenuEffect;Lcom/android/launcher3/menu/k;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/menu/MenuEffect$a;->h:Lcom/android/launcher3/menu/MenuEffect;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/menu/MenuEffect$a;->g:Lcom/android/launcher3/menu/k;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuEffect$a;->h:Lcom/android/launcher3/menu/MenuEffect;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuEffect$a;->g:Lcom/android/launcher3/menu/k;

    .line 4
    .line 5
    invoke-static {p1, p0}, Lcom/android/launcher3/menu/MenuEffect;->b(Lcom/android/launcher3/menu/MenuEffect;Lcom/android/launcher3/menu/k;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
