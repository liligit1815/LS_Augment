.class public interface abstract Lcom/android/launcher3/s$h;
.super Ljava/lang/Object;
.source "AutoInstallsLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/s;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "h"
.end annotation


# direct methods
.method public static b(Landroid/content/res/Resources;)Lcom/android/launcher3/s$h;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/s$h$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/s$h$a;-><init>(Landroid/content/res/Resources;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public a(I)Landroid/content/res/XmlResourceParser;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance p0, Landroid/content/res/Resources$NotFoundException;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/res/Resources$NotFoundException;-><init>()V

    .line 4
    .line 5
    .line 6
    throw p0
.end method

.method public getString(I)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance p0, Landroid/content/res/Resources$NotFoundException;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/res/Resources$NotFoundException;-><init>()V

    .line 4
    .line 5
    .line 6
    throw p0
.end method
