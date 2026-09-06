.class public final synthetic LN1/a;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/popup/PopupContainerWithArrow;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/popup/PopupContainerWithArrow;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LN1/a;->g:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, LN1/a;->g:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->c(Lcom/android/launcher3/popup/PopupContainerWithArrow;Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
