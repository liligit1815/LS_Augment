.class public final synthetic Ld2/d;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;

.field public final synthetic h:Landroid/net/Uri;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ld2/d;->g:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;

    .line 5
    .line 6
    iput-object p2, p0, Ld2/d;->h:Landroid/net/Uri;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ld2/d;->g:Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;

    .line 2
    .line 3
    iget-object p0, p0, Ld2/d;->h:Landroid/net/Uri;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;->y1(Lcom/android/launcher3/uioverrides/flags/DevOptionsUiHelper;Landroid/net/Uri;Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
