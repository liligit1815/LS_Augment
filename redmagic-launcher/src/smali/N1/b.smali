.class public final synthetic LN1/b;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


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
    iput-object p1, p0, LN1/b;->g:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, LN1/b;->g:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->b(Lcom/android/launcher3/popup/PopupContainerWithArrow;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
