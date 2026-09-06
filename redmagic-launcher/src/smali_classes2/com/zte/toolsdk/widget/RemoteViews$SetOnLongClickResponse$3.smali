.class Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$3;
.super Ljava/lang/Object;
.source "RemoteViews.java"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;->apply(Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$contentObserver:Landroid/database/ContentObserver;

.field final synthetic val$contentResolver:Landroid/content/ContentResolver;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;Landroid/content/ContentResolver;Landroid/database/ContentObserver;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$3;->val$contentResolver:Landroid/content/ContentResolver;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$3;->val$contentObserver:Landroid/database/ContentObserver;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onDismiss()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$3;->val$contentResolver:Landroid/content/ContentResolver;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse$3;->val$contentObserver:Landroid/database/ContentObserver;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
