.class public Lcom/android/launcher3/widget/N0;
.super Ljava/lang/Object;
.source "WidgetAddFlowHandler.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/android/launcher3/widget/N0;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected final g:Landroid/appwidget/AppWidgetProviderInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/N0$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/widget/N0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/widget/N0;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/appwidget/AppWidgetProviderInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/widget/N0;->g:Landroid/appwidget/AppWidgetProviderInfo;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    sget-object v0, Landroid/appwidget/AppWidgetProviderInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/appwidget/AppWidgetProviderInfo;

    iput-object p1, p0, Lcom/android/launcher3/widget/N0;->g:Landroid/appwidget/AppWidgetProviderInfo;

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;)Lcom/android/launcher3/widget/U;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/N0;->g:Landroid/appwidget/AppWidgetProviderInfo;

    .line 2
    .line 3
    invoke-static {p1, p0}, Lcom/android/launcher3/widget/U;->j(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)Lcom/android/launcher3/widget/U;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b()Z
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/N0;->g:Landroid/appwidget/AppWidgetProviderInfo;

    .line 2
    .line 3
    iget v0, p0, Landroid/appwidget/AppWidgetProviderInfo;->widgetFeatures:I

    .line 4
    .line 5
    and-int/lit8 v1, v0, 0x4

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    and-int/2addr v0, v3

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    move v0, v3

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v0, v2

    .line 17
    :goto_0
    iget-object p0, p0, Landroid/appwidget/AppWidgetProviderInfo;->configure:Landroid/content/ComponentName;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    return v3

    .line 24
    :cond_1
    return v2
.end method

.method public describeContents()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public e(Lcom/android/launcher3/C2;ILcom/android/launcher3/model/data/y;I)V
    .locals 0

    .line 1
    invoke-static {p2, p0, p3}, Lcom/android/launcher3/util/O1;->w(ILcom/android/launcher3/widget/N0;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/O1;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p1, p3}, Lcom/android/launcher3/C2;->C4(Lcom/android/launcher3/util/O1;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->I1()Lcom/android/launcher3/widget/l0;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    iget-object p0, p0, Lcom/android/launcher3/widget/N0;->g:Landroid/appwidget/AppWidgetProviderInfo;

    .line 13
    .line 14
    invoke-virtual {p3, p1, p2, p0, p4}, Lcom/android/launcher3/widget/l0;->X(Lcom/android/launcher3/v;ILandroid/appwidget/AppWidgetProviderInfo;I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public g(Lcom/android/launcher3/C2;ILcom/android/launcher3/model/data/y;I)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/N0;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-static {p2, p0, p3}, Lcom/android/launcher3/util/O1;->w(ILcom/android/launcher3/widget/N0;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/O1;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0}, Lcom/android/launcher3/C2;->C4(Lcom/android/launcher3/util/O1;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->I1()Lcom/android/launcher3/widget/l0;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0, p1, p2, p4}, Lcom/android/launcher3/widget/l0;->Y(Lcom/android/launcher3/v;II)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0
.end method

.method public h(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/A;I)Z
    .locals 1

    .line 1
    iget v0, p2, Lcom/android/launcher3/model/data/A;->g:I

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/android/launcher3/widget/N0;->g(Lcom/android/launcher3/C2;ILcom/android/launcher3/model/data/y;I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/N0;->g:Landroid/appwidget/AppWidgetProviderInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Landroid/appwidget/AppWidgetProviderInfo;->writeToParcel(Landroid/os/Parcel;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
