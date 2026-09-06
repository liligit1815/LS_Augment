.class Lcom/android/launcher3/testing/TestInformationHandler$a;
.super Ljava/lang/Object;
.source "TestInformationHandler.java"

# interfaces
.implements Lcom/android/launcher3/util/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/testing/TestInformationHandler;->init(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>(Lcom/android/launcher3/testing/TestInformationHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/testing/TestInformationHandler;->A()Ljava/util/Set;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/android/launcher3/testing/TestInformationHandler;->B()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    add-int/lit8 p0, p0, 0x1

    .line 13
    .line 14
    invoke-static {p0}, Lcom/android/launcher3/testing/TestInformationHandler;->C(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
