.class Lcom/zte/mifavor/widget/DatePickerZTE$c;
.super Landroid/view/View$BaseSavedState;
.source "DatePickerZTE.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/DatePickerZTE;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "c"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/zte/mifavor/widget/DatePickerZTE$c;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final g:I

.field private final h:I

.field private final i:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/mifavor/widget/DatePickerZTE$c$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/zte/mifavor/widget/DatePickerZTE$c$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/zte/mifavor/widget/DatePickerZTE$c;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 7
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 8
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE$c;->g:I

    .line 9
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE$c;->h:I

    .line 10
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE$c;->i:I

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/zte/mifavor/widget/f;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/DatePickerZTE$c;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcelable;III)V
    .locals 0

    .line 3
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 4
    iput p2, p0, Lcom/zte/mifavor/widget/DatePickerZTE$c;->g:I

    .line 5
    iput p3, p0, Lcom/zte/mifavor/widget/DatePickerZTE$c;->h:I

    .line 6
    iput p4, p0, Lcom/zte/mifavor/widget/DatePickerZTE$c;->i:I

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcelable;IIILcom/zte/mifavor/widget/f;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/zte/mifavor/widget/DatePickerZTE$c;-><init>(Landroid/os/Parcelable;III)V

    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/DatePickerZTE$c;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/DatePickerZTE$c;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/DatePickerZTE$c;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View$BaseSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    .line 2
    .line 3
    .line 4
    iget p2, p0, Lcom/zte/mifavor/widget/DatePickerZTE$c;->g:I

    .line 5
    .line 6
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 7
    .line 8
    .line 9
    iget p2, p0, Lcom/zte/mifavor/widget/DatePickerZTE$c;->h:I

    .line 10
    .line 11
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 12
    .line 13
    .line 14
    iget p0, p0, Lcom/zte/mifavor/widget/DatePickerZTE$c;->i:I

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
