.class Lcom/android/launcher3/b0$b;
.super Ljava/util/HashMap;
.source "DesktopGrid.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/b0;->n(Landroid/content/Context;Lcom/android/launcher3/F1;Ljava/lang/Boolean;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap<",
        "Ljava/lang/Integer;",
        "Lcom/android/launcher3/b0$e;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/b0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/b0;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/b0$b;->g:Lcom/android/launcher3/b0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object p1, Lcom/android/launcher3/b0$f;->o:Lcom/android/launcher3/b0$f;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/android/launcher3/b0$f;->c()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    sget-object v0, Lcom/android/launcher3/b0;->q:Lcom/android/launcher3/b0$e;

    .line 17
    .line 18
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    return-void
.end method
