.class Lcom/android/launcher3/uioverrides/H$a;
.super Ljava/lang/Object;
.source "QuickstepWidgetHolder.java"

# interfaces
.implements Lcom/android/launcher3/uioverrides/H$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/uioverrides/H;->p(ILcom/android/launcher3/widget/U;Ljava/lang/Runnable;)Lcom/android/launcher3/util/a2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/android/launcher3/uioverrides/H;Ljava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/uioverrides/H$a;->a:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(ILcom/android/launcher3/uioverrides/H$e;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I",
            "Lcom/android/launcher3/uioverrides/H$e<",
            "TT;>;TT;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/uioverrides/H;->l0()Lcom/android/launcher3/uioverrides/H$e;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-ne p1, p2, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/H$a;->a:Ljava/lang/Runnable;

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
