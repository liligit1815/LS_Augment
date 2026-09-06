.class Lcom/zte/mifavor/widget/NotificationMediaPanelBackground$a;
.super Ljava/lang/Object;
.source "NotificationMediaPanelBackground.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;->f()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground$a;->g:Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground$a;->g:Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground$a;->g:Lcom/zte/mifavor/widget/NotificationMediaPanelBackground;

    .line 8
    .line 9
    new-instance v1, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground$a$a;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Lcom/zte/mifavor/widget/NotificationMediaPanelBackground$a$a;-><init>(Lcom/zte/mifavor/widget/NotificationMediaPanelBackground$a;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
