.class public final synthetic Lcom/android/quickstep/util/c1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/util/SplitToWorkspaceController;

.field public final synthetic h:Landroid/app/PendingIntent;

.field public final synthetic i:Landroid/content/Intent;

.field public final synthetic j:Landroid/graphics/Bitmap;

.field public final synthetic k:Landroid/view/View;

.field public final synthetic l:Lcom/android/launcher3/model/data/B;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/util/SplitToWorkspaceController;Landroid/app/PendingIntent;Landroid/content/Intent;Landroid/graphics/Bitmap;Landroid/view/View;Lcom/android/launcher3/model/data/B;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/c1;->g:Lcom/android/quickstep/util/SplitToWorkspaceController;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/c1;->h:Landroid/app/PendingIntent;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/util/c1;->i:Landroid/content/Intent;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/util/c1;->j:Landroid/graphics/Bitmap;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/quickstep/util/c1;->k:Landroid/view/View;

    .line 13
    .line 14
    iput-object p6, p0, Lcom/android/quickstep/util/c1;->l:Lcom/android/launcher3/model/data/B;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/c1;->g:Lcom/android/quickstep/util/SplitToWorkspaceController;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/c1;->h:Landroid/app/PendingIntent;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/util/c1;->i:Landroid/content/Intent;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/quickstep/util/c1;->j:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/android/quickstep/util/c1;->k:Landroid/view/View;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/android/quickstep/util/c1;->l:Lcom/android/launcher3/model/data/B;

    .line 12
    .line 13
    invoke-static/range {v0 .. v5}, Lcom/android/quickstep/util/SplitToWorkspaceController;->c(Lcom/android/quickstep/util/SplitToWorkspaceController;Landroid/app/PendingIntent;Landroid/content/Intent;Landroid/graphics/Bitmap;Landroid/view/View;Lcom/android/launcher3/model/data/B;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
