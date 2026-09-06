.class public final synthetic Lcom/android/quickstep/util/d1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/util/SplitToWorkspaceController;

.field public final synthetic h:Landroid/app/PendingIntent;

.field public final synthetic i:I

.field public final synthetic j:I

.field public final synthetic k:Landroid/view/View;

.field public final synthetic l:Landroid/content/Intent;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/util/SplitToWorkspaceController;Landroid/app/PendingIntent;IILandroid/view/View;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/d1;->g:Lcom/android/quickstep/util/SplitToWorkspaceController;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/d1;->h:Landroid/app/PendingIntent;

    .line 7
    .line 8
    iput p3, p0, Lcom/android/quickstep/util/d1;->i:I

    .line 9
    .line 10
    iput p4, p0, Lcom/android/quickstep/util/d1;->j:I

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/quickstep/util/d1;->k:Landroid/view/View;

    .line 13
    .line 14
    iput-object p6, p0, Lcom/android/quickstep/util/d1;->l:Landroid/content/Intent;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/d1;->g:Lcom/android/quickstep/util/SplitToWorkspaceController;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/d1;->h:Landroid/app/PendingIntent;

    .line 4
    .line 5
    iget v2, p0, Lcom/android/quickstep/util/d1;->i:I

    .line 6
    .line 7
    iget v3, p0, Lcom/android/quickstep/util/d1;->j:I

    .line 8
    .line 9
    iget-object v4, p0, Lcom/android/quickstep/util/d1;->k:Landroid/view/View;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/android/quickstep/util/d1;->l:Landroid/content/Intent;

    .line 12
    .line 13
    invoke-static/range {v0 .. v5}, Lcom/android/quickstep/util/SplitToWorkspaceController;->a(Lcom/android/quickstep/util/SplitToWorkspaceController;Landroid/app/PendingIntent;IILandroid/view/View;Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
