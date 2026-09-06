.class Lcom/android/launcher3/widget/l0$a;
.super Ljava/lang/Object;
.source "LauncherWidgetHolder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/l0;->x(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:I

.field final synthetic h:Lcom/android/launcher3/widget/l0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/l0;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/l0$a;->h:Lcom/android/launcher3/widget/l0;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/widget/l0$a;->g:I

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
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "deleteAppWidgetId  appWidgetId="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget v1, p0, Lcom/android/launcher3/widget/l0$a;->g:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "LauncherWidgetHolder"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/widget/l0$a;->h:Lcom/android/launcher3/widget/l0;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/android/launcher3/widget/l0;->b:Lcom/android/launcher3/widget/p0;

    .line 28
    .line 29
    iget p0, p0, Lcom/android/launcher3/widget/l0$a;->g:I

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Landroid/appwidget/AppWidgetHost;->deleteAppWidgetId(I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
