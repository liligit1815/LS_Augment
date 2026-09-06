.class public final synthetic Lu2/C;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lu2/F;

.field public final synthetic h:Lu2/F$c;

.field public final synthetic i:Z

.field public final synthetic j:Landroid/graphics/drawable/GradientDrawable;

.field public final synthetic k:Landroid/view/ViewGroupOverlay;

.field public final synthetic l:Landroid/view/ViewOverlay;


# direct methods
.method public synthetic constructor <init>(Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lu2/C;->g:Lu2/F;

    .line 5
    .line 6
    iput-object p2, p0, Lu2/C;->h:Lu2/F$c;

    .line 7
    .line 8
    iput-boolean p3, p0, Lu2/C;->i:Z

    .line 9
    .line 10
    iput-object p4, p0, Lu2/C;->j:Landroid/graphics/drawable/GradientDrawable;

    .line 11
    .line 12
    iput-object p5, p0, Lu2/C;->k:Landroid/view/ViewGroupOverlay;

    .line 13
    .line 14
    iput-object p6, p0, Lu2/C;->l:Landroid/view/ViewOverlay;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lu2/C;->g:Lu2/F;

    .line 2
    .line 3
    iget-object v1, p0, Lu2/C;->h:Lu2/F$c;

    .line 4
    .line 5
    iget-boolean v2, p0, Lu2/C;->i:Z

    .line 6
    .line 7
    iget-object v3, p0, Lu2/C;->j:Landroid/graphics/drawable/GradientDrawable;

    .line 8
    .line 9
    iget-object v4, p0, Lu2/C;->k:Landroid/view/ViewGroupOverlay;

    .line 10
    .line 11
    iget-object v5, p0, Lu2/C;->l:Landroid/view/ViewOverlay;

    .line 12
    .line 13
    invoke-static/range {v0 .. v5}, Lu2/F;->h(Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
