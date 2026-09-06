.class Lcom/android/launcher3/uioverrides/H$b;
.super Ljava/lang/Object;
.source "QuickstepWidgetHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/uioverrides/H;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "b"
.end annotation


# instance fields
.field public final a:Lcom/android/launcher3/util/z0;

.field public b:Landroid/appwidget/AppWidgetProviderInfo;

.field public c:Landroid/widget/RemoteViews;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    new-instance v0, Lcom/android/launcher3/util/z0;

    invoke-direct {v0}, Lcom/android/launcher3/util/z0;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/uioverrides/H$b;->a:Lcom/android/launcher3/util/z0;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/uioverrides/M;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/H$b;-><init>()V

    return-void
.end method
