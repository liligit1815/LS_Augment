.class public final synthetic Lu2/D;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/a;


# instance fields
.field public final synthetic g:Lu2/F$c;

.field public final synthetic h:Z

.field public final synthetic i:Landroid/view/ViewGroupOverlay;

.field public final synthetic j:Landroid/graphics/drawable/GradientDrawable;

.field public final synthetic k:Z

.field public final synthetic l:Landroid/view/ViewOverlay;


# direct methods
.method public synthetic constructor <init>(Lu2/F$c;ZLandroid/view/ViewGroupOverlay;Landroid/graphics/drawable/GradientDrawable;ZLandroid/view/ViewOverlay;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lu2/D;->g:Lu2/F$c;

    .line 5
    .line 6
    iput-boolean p2, p0, Lu2/D;->h:Z

    .line 7
    .line 8
    iput-object p3, p0, Lu2/D;->i:Landroid/view/ViewGroupOverlay;

    .line 9
    .line 10
    iput-object p4, p0, Lu2/D;->j:Landroid/graphics/drawable/GradientDrawable;

    .line 11
    .line 12
    iput-boolean p5, p0, Lu2/D;->k:Z

    .line 13
    .line 14
    iput-object p6, p0, Lu2/D;->l:Landroid/view/ViewOverlay;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Lu2/D;->g:Lu2/F$c;

    .line 2
    .line 3
    iget-boolean v1, p0, Lu2/D;->h:Z

    .line 4
    .line 5
    iget-object v2, p0, Lu2/D;->i:Landroid/view/ViewGroupOverlay;

    .line 6
    .line 7
    iget-object v3, p0, Lu2/D;->j:Landroid/graphics/drawable/GradientDrawable;

    .line 8
    .line 9
    iget-boolean v4, p0, Lu2/D;->k:Z

    .line 10
    .line 11
    iget-object v5, p0, Lu2/D;->l:Landroid/view/ViewOverlay;

    .line 12
    .line 13
    invoke-static/range {v0 .. v5}, Lu2/F;->i(Lu2/F$c;ZLandroid/view/ViewGroupOverlay;Landroid/graphics/drawable/GradientDrawable;ZLandroid/view/ViewOverlay;)Lh4/t;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method
