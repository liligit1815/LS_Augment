.class Lcom/android/launcher3/widget/suggest/m$c;
.super Ljava/lang/Object;
.source "SuggestWidgetHostView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/suggest/m;->O0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/suggest/m;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/suggest/m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/suggest/m$c;->g:Lcom/android/launcher3/widget/suggest/m;

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
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/m$c;->g:Lcom/android/launcher3/widget/suggest/m;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    invoke-static {p0, v0, v1}, Lcom/android/launcher3/widget/suggest/m;->i0(Lcom/android/launcher3/widget/suggest/m;Landroid/widget/RemoteViews;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
