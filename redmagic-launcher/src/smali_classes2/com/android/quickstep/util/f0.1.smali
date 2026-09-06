.class public final synthetic Lcom/android/quickstep/util/f0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Landroid/content/Context;

.field public final synthetic h:[Landroid/content/Intent;

.field public final synthetic i:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;[Landroid/content/Intent;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/f0;->g:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/f0;->h:[Landroid/content/Intent;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/util/f0;->i:Landroid/view/View;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/f0;->g:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/f0;->h:[Landroid/content/Intent;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/util/f0;->i:Landroid/view/View;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/quickstep/util/ImageActionUtils;->e(Landroid/content/Context;[Landroid/content/Intent;Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
