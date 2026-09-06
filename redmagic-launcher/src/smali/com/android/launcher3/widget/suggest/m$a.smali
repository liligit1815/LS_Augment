.class Lcom/android/launcher3/widget/suggest/m$a;
.super Ljava/lang/Object;
.source "SuggestWidgetHostView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/suggest/m;->updateAppWidget(Landroid/widget/RemoteViews;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/widget/RemoteViews;

.field final synthetic h:Lcom/android/launcher3/widget/suggest/m;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/suggest/m;Landroid/widget/RemoteViews;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/suggest/m$a;->h:Lcom/android/launcher3/widget/suggest/m;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/widget/suggest/m$a;->g:Landroid/widget/RemoteViews;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/suggest/m$a;->h:Lcom/android/launcher3/widget/suggest/m;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/m$a;->g:Landroid/widget/RemoteViews;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/launcher3/widget/suggest/m;->j0(Lcom/android/launcher3/widget/suggest/m;Landroid/widget/RemoteViews;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
